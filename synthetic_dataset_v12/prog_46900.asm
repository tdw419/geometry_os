; DESCRIPTION: Renders a orange line between points (263, 150) and (164, 246).
; PLAN: r0=263(x1), r1=150(y1), r2=164(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 150
LDI r2, 164
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
