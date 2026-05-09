; DESCRIPTION: Renders a yellow line between points (178, 149) and (239, 78).
; PLAN: r0=178(x1), r1=149(y1), r2=239(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 149
LDI r2, 239
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
