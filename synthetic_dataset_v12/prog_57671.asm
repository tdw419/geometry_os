; DESCRIPTION: Renders a cyan line between points (142, 157) and (353, 69).
; PLAN: r0=142(x1), r1=157(y1), r2=353(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 157
LDI r2, 353
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
