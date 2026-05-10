; DESCRIPTION: Renders a yellow line between points (480, 32) and (58, 188).
; PLAN: r0=480(x1), r1=32(y1), r2=58(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 32
LDI r2, 58
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
