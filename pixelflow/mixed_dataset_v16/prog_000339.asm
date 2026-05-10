; DESCRIPTION: Renders a orange line between points (327, 175) and (307, 248).
; PLAN: r0=327(x1), r1=175(y1), r2=307(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 175
LDI r2, 307
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
