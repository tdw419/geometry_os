; DESCRIPTION: Renders a cyan line between points (442, 159) and (196, 205).
; PLAN: r0=442(x1), r1=159(y1), r2=196(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 159
LDI r2, 196
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
