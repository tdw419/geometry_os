; DESCRIPTION: Places a white line segment connecting (268, 224) to (261, 128).
; PLAN: r0=268(x1), r1=224(y1), r2=261(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 224
LDI r2, 261
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
