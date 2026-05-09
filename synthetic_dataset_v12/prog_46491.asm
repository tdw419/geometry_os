; DESCRIPTION: Renders a green line between points (370, 176) and (67, 38).
; PLAN: r0=370(x1), r1=176(y1), r2=67(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 176
LDI r2, 67
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
