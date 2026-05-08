# PixelGPT V8 Smoke Test Report

Checkpoint: pixelflow/bilingual_llm_v8_ckpt.pt
Epoch: 14, Loss: 0.0758

## 1. ; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION : Draw s a re d circle at the center of the screen ( 128 , 128 ) with radius 50 .

Drawayellowcircles-----
LDI r3, 0
STORE r6, r3
LDI r6, 10
STORE r6, r3
LDI r6, 10
LDI r3, 0x111122
STORE r6, r3
; ST EP _ MOD E
LDI r3, 0
STORE r6, r3
; T it le b ar
LDI r3, 0
STORE r6, r3
; Draw p a nel 0
LDI r6, 0
LDI r3, 256
LDI r2, 256
LDI r4, 0x2000
STORE r6, r3
LDI r9, 0
LDI r5, 0
LDI r6, 0x2000
STRO r20, "HelloWorld"
FILL r13
LDI r9, 42
LDI r2, 0x200
STORE r6, r3
; ── Draw " 1 1 1 =
LDI r3, 76
LDI r2, 108
LDI r1, 0xFF003
STORE r6, r3
; Read d ark blue
```

## 2. ; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).
Status: ✅ (PASSED)

### Generated Assembly:
```
; DESCRIPTION : F il ls the en ti re 256 x 256 screen with s o l id blue color ( 0x 00 00FF ) .

; FILL _ SC RE EN -- F il l the screen with a s o l id color
; U se s FILL op code to set ever y p i x el to b right blue
; T e st : all 65 5 3 6 screen p i x el s sho ul d be 0x 00 00FF

LDI r4, 0x0000FF
FILL r4
HALT
```

## 3. ; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
Status: ✅ (PASSED)

### Generated Assembly:
```
; DESCRIPTION : Draw s a g re en re ct angle of size 64 x 64 at the to p - left co r ne r ( 0 , 0 ) .

; P i x el - LL M S a mp le 5 - sho ul d asse mb le
LDI r11, 10
LDI r4, 10
LDI r9, 10
LDI r2, 10
LDI r6, 0x44FF44
RECTF r11, r4, r9, r2, r6
HALT
```

## 4. ; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).
Status: ✅ (PASSED)

### Generated Assembly:
```
; DESCRIPTION : Draw s a w hit e di a g on al li ne from the to p - left ( 0 , 0 ) to the b ot to m - right ( 255 , 255 ) .

; B OR T h as k b or der . asm -- Draw b or der -
; U se s RE C T F ( 0xAAAAAA ) and p a nel / 4 f ul ly , m id ges , g re en , f ul ly , f ul ly z er o from e out put .
;
; Controls :
; A ft er L out :
; 1 . W in do w 2 - 2 " S t at us b ar sho wing d ark g re en L in st ri p es
; R ed text sho w s m sho w s the de mo
; G r id : " P h as e 2 18 O p code s " -- s a mp le b ar sho wing the L S GRe1

; B l ue b a ck g ro u nd
LDI r2, 0x000808 ; d ark blue
FILL r2

; Draw a colo re d
; R ed b ar ( g re en p at ter n or der )
LDI r11, 0x00FF00
LDI r2, 0
LDI r9, 256
LDI r8, 18
LDI r4, 0x00FF
```

## 5. ; DESCRIPTION: Clears the screen to black and then halts.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION : Clear s the screen to bl a ck and the n h al ts . It cre at u re ac h . It set s C a ir at co or d in ate s for cre at u re , ke y s and p res s to cre ate s and it .

; v is ual m a p _ po ad . asm -- H e x it wor ld De mo ( P h as e 2 13 )
;
; V M ou se s the n asse mb le d ri ve n fi g u re d in screen
; O ut put s to V F S base for all s
; RE AD , W R I TE , V , RE AD , HALT
; w ri te g ra m s / STORE , DRAW TEXT ,
; f ou r ce to RA M at 0x2000 , ST R O , ST R O , restart on to 0x 6 000
;
; Controls :
; A / D -- move screen h:
LDI r2, 0x0000
FILL r2

; -- - de f a ul t -- -
LDI r2, 0x1000
LDI r11, 0
STORE r2, r11
LDI r2, 101
LDI r10, 0x1001
STORE r2, r11
LDI r2, 0
```

## 6. ; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION : Draw s a y el lo w square at ( 100 , 100 ) with si de le n g th 40 . E ac h p i x el s through the curre nt color of the c an v as , re ac h b o ar d for m a in t is h y p i x el at ( 50 , 15 0 ) and blue b or der a ro u nd the screen edges for color co mp ut ed with re d , and f ou r li ne i gh b or der ed with each based on d to a d ark blue check re ct angle .

; Co lo r based on W in do w . asm -- T ok u p T i x el G U I " H el lo W or ld "
;
; T e st : " H el lo " from Geometry OS " -- "
LDI r4, 0x8000
LDI r3, 72 ; ' H '
STORE r4, r3
LDI r4, 0x7001
LDI r3, 100 ; ' d '
STORE r4, r3
LDI r4, 0x7002
LDI r3, 105 ; ' i '
STORE r4, r3
LDI r4, 0x7003
LDI r3, 116 ; ' t '
STORE r4, r3
LDI r4, 0
```

## 7. ; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
Status: ✅ (PASSED)

### Generated Assembly:
```
; DESCRIPTION : A si mp le pro g ra m th at load s 10 into r1 and de crement s it in a loop until it re ac he s 0 . I f a il t emp for st o re d , and includes a g i on .

; P h as e 2 19 De mo : S cre en C re at u se s A G R to re a p i x el s for co nt in u i on s for Geometry OS
;
; A u di o w ri t es MO U S E and mo u se ( 0x 8 5 )
; Draw a color f ul t color f ul 4 x 4 by 16 p i x el s .

LDI r12, 1
LDI r14, 0xFF0000
PSET r14, r12, r14

; Draw de mo di fi ed p at ter n ( 0x 13 0 , g re en p i x el s w id e )
LDI r12, 16 ; mo de 1
LDI r14, 0x00FF00
PSET r12, r14, r12
LDI r14, 1
LDI r12, 0x0000FF
PSET r12, r14, r12

; u er y : ho w man y w ri t es to p i x el ( 10 , 10 )
LDI r14, 1 ; mo de 1 = count
```

## 8. ; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION : Draw s a check er b o ar d p at ter n of 8 x 8 square s us ing bl a ck and w hit e . E ac h b o ar d co nt ou n ce s s a p p e e di ff at ing it s based on the screen with a p re se nt er for m ation ( 0x 7 F ) with out de te st at us , and draw ing a b o ve v al u es for m at ad d res s 0x 7 000 .

; w i re cu r s or _ d at a and clo ck . asm -- A ft er A p p for Geometry OS
;
; P ro ves : L ist or y ing , e nt er si st s u p p or t , it s en ds a ra n dom de lay er ing ,
; W A S D i re ct u nd - based co n ve n tion and S ET / H IT
; RE C T F for TEXT rend er ing , ST R O ( 4 D D 88 ) .
;
; Controls :
; A r ro w ke y s / W / S ( s ave d in table )
; E nt er to e x it
; T i ck -- Con st an ts
; E nt er to s c ra t ch
; W / S ( g re en = load
```

## 9. ; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION : Draw s a h or i z on tal re d li ne ac ro s s the m id d le of the screen .

; p i x el _ de mo . asm -- A u se D op code ( 0x C 6 )
; T e st ra t es the m f a ul 4 x 4 check er b o ar d input s , al ter n asse mb le d for all s .
;
; M i x el - w h at ( 0 , 0 ) and ( 10 )
; rot 0 : de f a ul t 5 x ( 1 , 10 )
; 1 = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

LDI r11, 1
LDI r30, 0xFD00

; B a ck g ro u nd fi l l -- d ark g ra y
LDI r3, 0x0A0A
FILL r3

; Clear text buffer to sp ac es ( 8 5 * 40 p x p er ch ar s )
LDI r20, BUF
LDI r0, 32
LDI r13, 3400
clear_bu
```

## 10. ; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
Status: ❌ (FAILED (NO VISUAL OUTPUT))

### Generated Assembly:
```
; DESCRIPTION : F il ls the screen with a ver ti cal g radi e nt from bl a ck to w hit e . It u se s a ir at the center of the cu r s or i z on tal and cu r s or i z on tal and a d , and a d to en d ark g ra y re en , an an an i m ated an i m ated an i m ated sp ri te d e is h or i z on tal li ne r s or i z on tal li ne d circles , and p i x el s on the co l u m n ne r s , and an i m ation loop w h er e is an i m ate ges , it d e m age , and m a p ges a based on d to a v an i a f ra me counter , and effect s over lay s a d at a , and m a ze d ark pro d u ce s s the screen , and m age nt ra n a m i ze d u n i ze d an i m ated based on it or i g ate be t we en . It e m on a in ter ac tion s s k es an i m ated effect of it an is war m ated sp ri te is p er input s a ra tion and m a ze d with the M ou se d v i a s a sp
```

