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