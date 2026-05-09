; DESCRIPTION: Renders a orange line between points (327, 194) and (28, 16).
; PLAN: r0=327(x1), r1=194(y1), r2=28(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 194
LDI r2, 28
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
