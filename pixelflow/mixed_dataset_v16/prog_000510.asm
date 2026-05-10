; DESCRIPTION: Renders a black line between points (16, 25) and (215, 75).
; PLAN: r0=16(x1), r1=25(y1), r2=215(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 25
LDI r2, 215
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
