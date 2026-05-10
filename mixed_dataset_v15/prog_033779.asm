; DESCRIPTION: Places a orange line segment connecting (333, 213) to (238, 120).
; PLAN: r0=333(x1), r1=213(y1), r2=238(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 213
LDI r2, 238
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
