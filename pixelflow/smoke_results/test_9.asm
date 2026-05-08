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