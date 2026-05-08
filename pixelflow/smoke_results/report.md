# PixelGPT V5 Smoke Test Report

Checkpoint: pixelflow/bilingual_llm_v8_ckpt.pt
Epoch: 13, Loss: 0.0840

## 1. ; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a re d circle at the center of the screen ( 128 , 128 ) with radius 50 .

; circles . asm -- concentric circles with cycling colors

; center
LDI r4, 128
LDI r3, 128

; radius counter
LDI r6, 10

; loop count
LDI r11, 12

loop:
; color = radius * 20 ( cycles through hues roughly )
LDI r5, 20
MUL r5, r11

; shift into blue channel for variation
LDI r12, 0x0001000
MUL r12, r15
LDI r11, 0xFF
AND r15, r11
OR r15, r12

CIRCLE r4, r3, r15, r12

; radius += 20
LDI r4, 20
ADD r9, r4

; loop
LDI r4, 1
SUB r2, r4
JNZ r2, loop

HALT
```

## 2. ; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : F il ls the en ti re 256 x 256 screen with s o l id blue color ( 0x 00 00FF ) .
; U se s FILL -- all through the PSET ac co l u m n in a b right b a ck .

LDI r8, 0 ; y
LDI r15, 256 ; li m it

; ── Draw g radi e nt ac tion : color = x ( blue ) ──
LDI r10, 0 ; co l counter
LDI r2, 1 ; in crement
LDI r4, 256 ; li m it

bg_loop:
PSET r10, r2, r4
ADD r10, r1 ; x + +
LDI r0, 1
ADD r10, r0
CMP r10, r15
BLT r5, bar_x_loop

ADD r2, r0
CMP r2, r8
BLT r5, bar_y

; ── Draw re d square ( triangle channel channel on channel on channel ) ──
LDI r8, 0 ; s a ir channel
LDI r15, 0 ; s a fe to channel
LDI r4, 60 ; y
MOV r3, r15
LDI r13, 4 ; w id th

draw_loop:
CMP r15, r3
BGE r5, draw_don
```

## 3. ; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a g re en re ct angle of size 64 x 64 at the to p - left co r ne r ( 0 , 0 ) .

; P h as e 2 19 De mo : S cre en C a p t u re to RA M
; = = = = =
; Draw s 10 p i x el s ac ro s s the screen
; U se s PSET ( 0x2000 = x ) from screen ( 0x 00 00 00FF )
; 0x 00 = 0x00FF00 1 = 50
; 0x 1000 : screen base ( re d y counter )
; 0x 10 1 1 = RA M at 0x2000 ( n ul l co p i ed d p i x el s )
; 0x 2 100 - 0x2009 : RA M are a g a in color ( 0x 00 00 00FF )
; 0x 00 00 .. 0x 01 7 8 - 0x2009 FF p i x el s co p i ed d in ate s
; 0x 00 8 - V M d res s of screen p i x el s
; ── Con st an ts ──────────────────────────────────────
LDI r2, 0x2000 ; p i x el counter
LDI r13, 0x2000 ; p i x el color ( 0 , 0 )
LDI r12, 0x2000 ; p i x el s

COPY_LOOP:
LOAD
```

## 4. ; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a w hit e di a g on al li ne from the to p - left ( 0 , 0 ) to the b ot to m - right ( 255 , 255 ) .

; U se s FILL ( regist er - based ) for PSET ( regist er - based ) for PSET ( regist er - based ) for d y n a p p ing

; Re gist ers :
; r7 = r14 = angle ( 0 - 1 )
; r4 = s c ra t ch
; r10 = s c ra t ch
; r14 = s c ra t ch
; r7 = color ( w hit e )
; r15 = s c ra t ch
; r6 = color ( w hit e )
; r1 3 = s c ra t ch
; r10 = color ( w hit e )
; r7 = color
; r14 = s c ra t ch

; r15 = ke y code from MO U S E
; r9 - mo u se Y from MO U S E
; r8 - mo u se Y ( from MO U S E
; r0 - mo u se Y ( d , b ut t on ( from MO U S E )
; r14 - ble nd re d , 0xFF 00 00
; r6 - r16 = loop count ers
; r20 = RA M po in ter
; r21 = s c ra t ch for color index
```

## 5. ; DESCRIPTION: Clears the screen to black and then halts.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Clear s the screen to bl a ck and the n h al ts .

; re ad RA M 0x 7 000 ( 32 )
; RA M 0x 7 8 20 = RA M 0x 7 8 20 = RA M 0x 7 8 20 = 0x 7 02 = color table ( 16 e nt ri es , R G B )
; RA M 0x 7 8 00 = ac tion color ( 0 .. 0x 7 02 B channel )
; RA M 0x 7 00 = c p res er ves color table ( 16 e nt ri es , for 16 co rre ct each )
; RA M 0x 7 8 00 = c a p b o ar d y
; RA M 0x 7 8 01 = c a m er a_ y
; RA M 0x 7 8 02 = f ra me _ counter
; RA M 0xFF B = ke y bi t m as k
;
; = = = = = Con st an ts = = = =
LDI r11, 1 ; co n st an t 1
LDI r0, 64 ; T IL E S p er a x is
LDI r14, 4 ; ti le p i x el s
LDI r2, 0xFFB ; ke y bi t
```

## 6. ; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a y el lo w square at ( 100 , 100 ) with si de le n g th 40 .

DR0x10000 ; st e p s_ a ze ce ( c r on g r id ( 0x00FF00 )
;
; A r id ( c r id with w hit e , cy an , cy an , cy an ) is c r id ( 16 , 100 ) is n on ( c ale n on )

; Co lo r : LDI , 0xFF 00 00 -- p y el lo w , each 7 in 8 x 8 , each 15 g r id ( 7 , 23 6 )
; Co lo r ri p e nt s , 15 , 23 0 in 3 - h or i z on tal
; Co lo r shift s a h or i z on tal o : w hit e at ter n
; Co lo r on g r id ( 8 , 10 ) -> p i x el s , 23 6 )
; Co lo r shift hu e at ( 2 A ) -> p i x el s , 23 6 )
; 16 - b ut e at p i x el s , 7 : 0 .. 14
;
; Re gist er co n ve n tion :
; r8 = co or d ay s in co or d in ate s
; r8 = co
```

## 7. ; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : A si mp le pro g ra m th at load s 10 into r1 and de crement s it in a loop until it re ac he s 0 .

; li b_ te st _ v 4 . asm -- T e st s ALL li b ra ry mod u les , st d li b , m a p ,
; draw , input , ra n dom , g f x .
;
; T e st d at a : st r le n , st r c p y , st r c p y , me m set , i to a , p r in t _ st r , p r in t _ in t
; A ls o te st s : . st r di re c ti ve and . li b / . inclu de l ink ing
;
; U se s . st d at a st ring s , the n c all s li b ra ry f u n ction s
;
.org0xC
```

## 8. ; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a check er b o ar d p at ter n of 8 x 8 square s us ing bl a ck and w hit e .

; CHECK ER s a p p e e k effect s a ck s a ges and p res se s a ck ed as R G B
;
; Re gist er al lo c ation :
; r4 = g re en lo ck ( 0x00FF00 )
; r4 = vx ( + NEG ) )
; r6 = vy ( + 1 or counter )
; r16 = f ra me counter
; r17 = s c ra t ch / color ( w hit e )
; r7 = s c ra t ch

; ── init ──────────────────────────────────────────────── ────────
LDI r4, 128 ; cu r s or X
LDI r8, 128 ; cu r s or X
LDI r9, 1 ; cu r s or Y
LDI r15, 0xFFFFF ; ke y p or t ad d res s
LDI r15, 0x00FFFF ; cu r s or color ( cy an )
LDI r13, 0 ; s ave d ke y RA M ad d res s
LDI r1, 0x00FF00 ; g re en color ( u r p le )
LDI r11, 1 ; s ave d ke y RA M 0x 7 8 000 + N
```

## 9. ; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a h or i z on tal re d li ne ac ro s s the m id d le of the screen .

; c ro l l _ de mo . asm -- draw a b right b ar at y = 240 the n s c ro l l it u p war d
; CMP al w ay s w ri t es res ul t into r15 , s o ke e p x in r0 , u se r0 on ly for CMP

LDI r6, 0 ; x counter
LDI r12, 256 ; li m it
LDI r9, 0x00FF00 ; g re en color ( for PSET g re en )

x_loop:
PSET r6, r12, r9 ; p i x el
ADD r6, r9 ; x + +
LDI r1, 0
ADD r1, r13
SUB r1, r9
JZ r1, next_loop
JMP x_loop

next_x:
ADD r6, r9 ; y + +
ADD r11, r9 ; st ri p e p e p i x el counter + +
LDI r1, 0
ADD r1, r11
SUB r1, r9
JNZ r1, check_y
; T o g g le color and re set counter
LDI r1
```

## 10. ; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : F il ls the screen with a ver ti cal g radi e nt from bl a ck to w hit e . It u se s the n i z on tal ly al ter mine th at ing an ing through the v i si ble .

; C an v m . asm -- P at ter n ( si m ul ated load ed at 0x 6 0 )
; 8 x 8 g r id , each ro w s of 16 p i x el s .
; U se s PSET ( regist er - based ) for all s ( si g ne d co ls = x ) for d y n a m i c co or ds .

; RA M L ay out :
; 0x2000 - 0x 20 FF F : L ay er 1 bi ases of 0x 20 C F : 16 + index * 16 + 15
; R o w h er e nt ri es ( u p , u r p le )
; R o w starts 0 = LINE 1 -> G , G = g r id ( 2 2 ) 3 1 = Sto ne s
;
; R o w 0 : 0 - 1 = e nt ry ( G + 2 2 ) 3 B = life
;
; Re gist er co n ve n tion :
; r10 = co or d in ate s
; r9 =
```

