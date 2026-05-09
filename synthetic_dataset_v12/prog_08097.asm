; DESCRIPTION: Renders a green line between points (256, 196) and (11, 16).
; PLAN: r0=256(x1), r1=196(y1), r2=11(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 196
LDI r2, 11
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
