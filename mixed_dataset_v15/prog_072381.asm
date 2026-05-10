; DESCRIPTION: Renders a green line between points (440, 22) and (250, 27).
; PLAN: r0=440(x1), r1=22(y1), r2=250(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 22
LDI r2, 250
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
