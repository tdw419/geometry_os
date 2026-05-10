; DESCRIPTION: Renders a cyan line between points (0, 21) and (282, 45).
; PLAN: r0=0(x1), r1=21(y1), r2=282(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 21
LDI r2, 282
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
