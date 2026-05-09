; DESCRIPTION: Renders a black line between points (164, 222) and (210, 68).
; PLAN: r0=164(x1), r1=222(y1), r2=210(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 222
LDI r2, 210
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
