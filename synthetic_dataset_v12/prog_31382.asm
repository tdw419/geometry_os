; DESCRIPTION: Renders a white line between points (286, 240) and (415, 63).
; PLAN: r0=286(x1), r1=240(y1), r2=415(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 240
LDI r2, 415
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
