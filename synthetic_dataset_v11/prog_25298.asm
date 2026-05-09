; DESCRIPTION: Renders a green line between points (60, 184) and (67, 220).
; PLAN: r0=60(x1), r1=184(y1), r2=67(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 184
LDI r2, 67
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
