; DESCRIPTION: Renders a orange line between points (386, 25) and (246, 46).
; PLAN: r0=386(x1), r1=25(y1), r2=246(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 25
LDI r2, 246
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
