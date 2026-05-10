; DESCRIPTION: Renders a cyan line between points (350, 71) and (442, 109).
; PLAN: r0=350(x1), r1=71(y1), r2=442(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 71
LDI r2, 442
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
