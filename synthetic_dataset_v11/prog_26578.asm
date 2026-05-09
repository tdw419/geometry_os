; DESCRIPTION: Renders a green line between points (209, 29) and (114, 220).
; PLAN: r0=209(x1), r1=29(y1), r2=114(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 29
LDI r2, 114
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
