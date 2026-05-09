; DESCRIPTION: Renders a cyan line between points (359, 209) and (436, 39).
; PLAN: r0=359(x1), r1=209(y1), r2=436(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 209
LDI r2, 436
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
