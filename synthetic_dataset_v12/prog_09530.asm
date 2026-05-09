; DESCRIPTION: Draws a white line from (64, 13) to (271, 162).
; PLAN: r0=64(x1), r1=13(y1), r2=271(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 13
LDI r2, 271
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
