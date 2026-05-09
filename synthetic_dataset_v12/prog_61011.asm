; DESCRIPTION: Draws a green line from (113, 7) to (23, 205).
; PLAN: r0=113(x1), r1=7(y1), r2=23(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 7
LDI r2, 23
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
