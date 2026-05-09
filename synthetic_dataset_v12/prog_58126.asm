; DESCRIPTION: Renders a orange line between points (178, 213) and (302, 108).
; PLAN: r0=178(x1), r1=213(y1), r2=302(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 213
LDI r2, 302
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
