; DESCRIPTION: Renders a green line between points (415, 86) and (69, 178).
; PLAN: r0=415(x1), r1=86(y1), r2=69(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 86
LDI r2, 69
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
