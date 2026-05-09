; DESCRIPTION: Renders a green line between points (188, 196) and (108, 128).
; PLAN: r0=188(x1), r1=196(y1), r2=108(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 196
LDI r2, 108
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
