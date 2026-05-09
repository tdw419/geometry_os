; DESCRIPTION: Renders a green line between points (209, 206) and (188, 86).
; PLAN: r0=209(x1), r1=206(y1), r2=188(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 206
LDI r2, 188
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
