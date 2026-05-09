; DESCRIPTION: Renders a green line between points (384, 95) and (447, 90).
; PLAN: r0=384(x1), r1=95(y1), r2=447(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 95
LDI r2, 447
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
