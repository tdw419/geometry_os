; DESCRIPTION: Renders a black line between points (215, 48) and (434, 157).
; PLAN: r0=215(x1), r1=48(y1), r2=434(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 48
LDI r2, 434
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
