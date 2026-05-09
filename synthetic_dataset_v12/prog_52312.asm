; DESCRIPTION: Renders a orange line between points (479, 151) and (254, 109).
; PLAN: r0=479(x1), r1=151(y1), r2=254(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 151
LDI r2, 254
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
