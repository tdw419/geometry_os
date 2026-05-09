; DESCRIPTION: Renders a green line between points (387, 224) and (315, 226).
; PLAN: r0=387(x1), r1=224(y1), r2=315(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 224
LDI r2, 315
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
