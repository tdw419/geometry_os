; DESCRIPTION: Renders a orange line between points (460, 69) and (238, 66).
; PLAN: r0=460(x1), r1=69(y1), r2=238(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 69
LDI r2, 238
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
