; DESCRIPTION: Renders a cyan line between points (209, 157) and (4, 136).
; PLAN: r0=209(x1), r1=157(y1), r2=4(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 157
LDI r2, 4
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
