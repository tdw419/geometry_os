; DESCRIPTION: Renders a green line between points (4, 149) and (440, 64).
; PLAN: r0=4(x1), r1=149(y1), r2=440(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 149
LDI r2, 440
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
