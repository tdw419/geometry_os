; DESCRIPTION: Places a cyan line segment connecting (186, 136) to (436, 240).
; PLAN: r0=186(x1), r1=136(y1), r2=436(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 136
LDI r2, 436
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
