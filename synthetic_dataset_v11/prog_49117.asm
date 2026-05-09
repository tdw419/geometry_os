; DESCRIPTION: Renders a green line between points (128, 3) and (86, 107).
; PLAN: r0=128(x1), r1=3(y1), r2=86(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 3
LDI r2, 86
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
