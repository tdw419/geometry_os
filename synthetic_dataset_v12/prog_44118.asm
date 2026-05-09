; DESCRIPTION: Renders a orange line between points (408, 27) and (492, 246).
; PLAN: r0=408(x1), r1=27(y1), r2=492(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 27
LDI r2, 492
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
