; DESCRIPTION: Places a orange line segment connecting (143, 213) to (460, 183).
; PLAN: r0=143(x1), r1=213(y1), r2=460(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 213
LDI r2, 460
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
