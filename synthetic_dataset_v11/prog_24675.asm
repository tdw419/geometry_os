; DESCRIPTION: Renders a blue line between points (229, 82) and (59, 224).
; PLAN: r0=229(x1), r1=82(y1), r2=59(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 82
LDI r2, 59
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
