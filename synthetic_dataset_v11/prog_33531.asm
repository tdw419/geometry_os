; DESCRIPTION: Renders a cyan line between points (252, 253) and (40, 90).
; PLAN: r0=252(x1), r1=253(y1), r2=40(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 253
LDI r2, 40
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
