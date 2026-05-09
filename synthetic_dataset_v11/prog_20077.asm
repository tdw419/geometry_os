; DESCRIPTION: Renders a green line between points (0, 209) and (255, 160).
; PLAN: r0=0(x1), r1=209(y1), r2=255(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 209
LDI r2, 255
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
