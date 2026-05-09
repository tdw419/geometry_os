; DESCRIPTION: Draws a white line from (23, 65) to (271, 172).
; PLAN: r0=23(x1), r1=65(y1), r2=271(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 65
LDI r2, 271
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
