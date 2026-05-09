; DESCRIPTION: Renders a green line between points (265, 8) and (415, 240).
; PLAN: r0=265(x1), r1=8(y1), r2=415(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 8
LDI r2, 415
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
