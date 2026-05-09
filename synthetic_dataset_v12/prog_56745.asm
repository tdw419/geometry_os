; DESCRIPTION: Draws a white line from (450, 48) to (344, 224).
; PLAN: r0=450(x1), r1=48(y1), r2=344(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 48
LDI r2, 344
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
