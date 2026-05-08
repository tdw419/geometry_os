# PixelGPT V5 Smoke Test Report

Checkpoint: pixelflow/bilingual_llm_v5_ckpt.pt
Epoch: 20, Loss: 0.3736

## 1. ; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a re d circle at the center of the screen ( 128 , 128 ) with radius 50 . The radius of 128 and 50 ble nd as a s ing le r p i x el s ( 20 , 20 ) . The HALT is drawn at co or d in ate s ( 20 , 10 ) with center ( 2 , 128 ) with radius 50 and blue , b or der , b or der , w hi le w id th s ing from center co r ne r s ( 9 4 , 25 4 ) .

; P i x el 1 : si mp le g ne d u ated t ra n si tion s : center of 4 p i x el = 10 .. 255 .
; P o si mp le r p i x el center p at ter n s ever y 4 th f ra me .
; P o si tion : de l is ne g a ti ve with b or at g in al p i x el s .

; B or der : co p y , w hit e at y = 1 , colo re d , b or der , y = right ( 128 , center of g re en .
; B or der - p i x el at ( 10 , 0 ) with color
LDI r8, 1
LDI r9, 200
LDI r9, 60
RECTF r9
```

## 2. ; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : F il ls the en ti re 256 x 256 screen with s o l id blue color ( 0x 00 00FF ) . It the n draws a circle centered at ( 10 , 10 ) us ing color 0x 80 5 and color 0x 80 C E . The circle is drawn with center co or d in ate s ( 10 , 10 ) with a radius of 0x 80 7 . The circle is drawn at ( 25 4 9 C 1 , 16 ) with color 0x 8 E 9 6 A C 2 .

; si mp le draw pro g ra m
; initi ali z ation
LDI r0, 32
LDI r12, 0xF00F00
LDI r0, 255
LDI r13, 0x5C8F95
LDI r6, 0x0A0F00
LDI r7, 0x3F0444
LDI r9, 4
CIRCLE r2, r0, r7, r9
LDI r7, 10
LDI r10, 2
LDI r14, 0xCE3CFB
LDI r1, 0x3D4856
CIRCLE r7, r10, r14, r1
HALT
```

## 3. ; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a g re en re ct angle of size 64 x 64 at the to p - left co r ne r ( 0 , 0 ) . E ac h the se co nd p i x el , w hit e color 0x4 0 10 10 and t ru n s the m for i x el s on the cu r s or position ( 10 , 10 ) us ing the PSET in stru ction to p - left co r ne r at ( 128 , 10 ) with the color 0x E 20 7 .

; si mp le draw pro g ra m
; initi ali z ation
LDI r2, 32
LDI r3, 0
LDI r4, 128
LDI r15, 10
LDI r0, 256
LDI r4, 8
LDI r10, 0x3E16F9
LDI r9, 0xC08B88
LINE r2, r1, r10, r9, r10
LDI r7, 1
SUB r3, r3, r7
JNZ r3, loop_0
HALT
```

## 4. ; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a w hit e di a g on al li ne from the to p - left ( 0 , 0 ) to the b ot to m - right ( 255 , 255 ) .
LDI r1, 0
LDI r2, 2
LDI r3, 256
LDI r4, 256
LDI r5, 0x0000CC
RECTF r1, r2, r3, r4, r5
LDI r1, 10
LDI r2, 10
LDI r3, 16
LDI r4, 40
LDI r5, 0x0000FF
RECTF r1, r2, r3, r4, r5

; G re en b ut t on ( blue b lo ck ) as at b ot to m over l a be l
LDI r1, 0
LDI r2, 256
LDI r3, 40
LDI r4, 10
LDI r5, COLOR_Y
RECTF r1, r2, r3, r4, r5

; O r s or re d in di c at or b or der
LDI r1, 2
LDI r2, 0
LDI r3, 256
LDI r4, 16
LDI r5, COLOR_Y
RECTF r1, r2, r3, r4, r5

; Y el lo w b lo ck
LDI r1, 0
LDI r2, 256
LDI r3, 1
```

## 5. ; DESCRIPTION: Clears the screen to black and then halts.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Clear s the screen to bl a ck and the n h al ts .

; De m on st ra t es the screen us ing the W A S S S I _ P I X E L op code ( 0x 7 8 00 )
; S ho w s en d " A S CI I ' ( A S CI I 6 ), re sp on se with co p y ing
; 8 . U se s T RA M 0x 7 000 , n "
;
LDI r0, 1 ; mo de 1 : a p pro g ra m
LDI r9, 0x1000 ; s ou r ce
STRO r9, "Hello"

; -- Read b o ar d --
LDI r9, 0x1200
LDI r0, 1
STORE r9, r0

; S e t initi ali ze --
LDI r0, 0x1201
LDI r0, 121 ; p
STORE r9, r0
LDI r9, 0
```

## 6. ; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a y el lo w square at ( 100 , 100 ) with si de le n g th 40 . E ac h f o l lo w s by c an v as g re en g re en in st e ad . E ac h a p es the screen , w h er e it co nt in u es to draw a li ne on the screen us ing the LINE in stru ction be f o re h al t ing e x e cu tion .

; P h as e 10 : draw_ p i x el C T F . asm -- I nt N e w t De mo
;
; Read s a w hit e center ( 0 , 3 0 )
; De m on st ra t es to screen p - left center ( 2 , 5 ) and ( 3 5 ) with w hit e , the n draw ing an i m ated color v i a LOAD
; E ac h screen x 3 0 p i x el s centered on the screen ( 50 , 0 ) .
; W e st e p sho t
; This de mo : ge nera t ed ver if i c ation is h a ir at g a ti ve .
;
; Memory layout :
; 0x2000 - 0x5 00 1 FF : re d p i x el s ( 20 p x w ay s , y )
;
```

## 7. ; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : A si mp le pro g ra m th at load s 10 into r1 and de crement s it in a loop until it re ac he s 0 . It the n e nt ers a loop w h er e it w a it s for an o th er ke y p res s ( ' S ' ) to e x it s u b t ra ct ing a p pro ac ter i z on the screen . The loop includes a m a in _ 4 in stru ction to di sp lay a f ra me and re t u r n s to the start of the loop .

; input d ri ve n pro g ra m
; initi ali z ation
LDI r9, 0xF7ED91
LDI r25, 16
main_0:
IKEY r9
CMPI r9, 0x5137DF
JNZ r9, key_1
LDI r9, 0x997976
LDI r2, 4
LDI r4, 1
LDI r10, 4
RECTF r9, r2, r4, r10, r10
FRAME
JMP main_0
```

## 8. ; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a check er b o ar d p at ter n of 8 x 8 square s us ing bl a ck and w hit e . It w ri t es to the screen , the n e nt ers a s er i es of loop w h er e it re p e ated ly checks if the p res se d to p - right co r ne r d by o th er counter . The pro v id es o th er w i se , it di sp lay s the text " H E L LO " and " W OR L D " on the screen at a sp e ci fi c position , updates the f ra me , and the n re p e at s .

; input d ri ve n pro g ra m
; initi ali z ation
LDI r2, 256
LDI r9, 255
main_0:
LDI r10, 3526
LDI r14, 0x158ED0
LDI r6, 0x319329
TEXT r10, r14, r6, "HELLO"
LDI r14, 74
LDI r2, 3560
LDI r1, 64
WPIXEL
LDI r10, 10
LDI r12, 0xE72C0C
LDI r12, 0xC35BF7
TEXT r10, r12
```

## 9. ; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : Draw s a h or i z on tal re d li ne ac ro s s the m id d le of the screen . The de m on st ra t es c ro s s the screen and b ou n ce by it b ar s for co nt e nt s . It u se s RE C T F for the b ot to m over lay are a , with var i o us p i x el s , and re set it s li ne s on the screen , h al ts e x e cu tion after co mp let ing the fi le n ame d .

; li m _ de mo . asm -- A u se s se s a s o l
; P i x el A S S L ay out :
; L ay out :
; R o w 0 : square , mo u se s PSET , FILL , TEXT , RE C T F , FILL , RE C T F , FILL ,
; P o g in t _ re g , re en , ST R O , TEXT , FRAME , RE C T F , FILL , RE C T F .
; TEXT -- TEXT -
; P re - di re ct s , FRAME . loop s .
; Controls :
; Right ar ro w s from cu r s or co r ne r m n ( 0 - 100 )
; C op y first li ne
```

## 10. ; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
Status: ✅

### Generated Assembly:
```
; DESCRIPTION : F il ls the screen with a ver ti cal g radi e nt from bl a ck to w hit e . It the n the n over lay er at the to p - left co r ne r of the to p - left co r ne r at ( 0 , 1 ) with color 0x 8 FF , di me n sion s s u b se q ue nt ly for si st of the he i ght s u b se q ue st ing to in a c an v as h or i z on tal li ne .

; T e st . asm -- Con st an ts for Geometry OS
; T e st d at us b ar ( y )
; 8 . A n i m ate s a p p ed to s ave
; 4 . C lo se s o ck s :
; S t ate s a 4 - based c an v as
; T i me di u m b t ra ct s the s w it ch
; - S e t a pro g ra m s h t t t ra ck s ( v al ue )
; - S imp le d at a ( x ) with color
;
; L ay out :
; r10 - r11 - r11 ( sho ul d be lo w , he i ght )
; r11 - r12 - r11 ( all )
; r11 - color (
```

