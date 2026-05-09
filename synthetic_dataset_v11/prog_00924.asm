; DESCRIPTION: Renders a green line between points (32, 172) and (239, 40).
; PLAN: r0=32(x1), r1=172(y1), r2=239(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 172
LDI r2, 239
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
