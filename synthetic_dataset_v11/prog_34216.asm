; DESCRIPTION: Renders a black line between points (215, 4) and (70, 250).
; PLAN: r0=215(x1), r1=4(y1), r2=70(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 4
LDI r2, 70
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
