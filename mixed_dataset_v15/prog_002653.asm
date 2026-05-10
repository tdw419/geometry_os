; DESCRIPTION: Renders a orange line between points (406, 187) and (128, 237).
; PLAN: r0=406(x1), r1=187(y1), r2=128(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 187
LDI r2, 128
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
