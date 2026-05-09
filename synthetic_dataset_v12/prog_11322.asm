; DESCRIPTION: Renders a green line between points (209, 148) and (54, 0).
; PLAN: r0=209(x1), r1=148(y1), r2=54(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 148
LDI r2, 54
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
