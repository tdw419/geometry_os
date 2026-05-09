; DESCRIPTION: Renders a orange line between points (0, 206) and (238, 166).
; PLAN: r0=0(x1), r1=206(y1), r2=238(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 206
LDI r2, 238
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
