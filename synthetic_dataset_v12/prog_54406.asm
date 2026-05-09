; DESCRIPTION: Renders a cyan line between points (436, 28) and (384, 119).
; PLAN: r0=436(x1), r1=28(y1), r2=384(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 28
LDI r2, 384
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
