; DESCRIPTION: Renders a orange line between points (345, 111) and (481, 83).
; PLAN: r0=345(x1), r1=111(y1), r2=481(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 111
LDI r2, 481
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
