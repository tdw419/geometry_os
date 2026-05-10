; DESCRIPTION: Renders a cyan line between points (226, 12) and (104, 126).
; PLAN: r0=226(x1), r1=12(y1), r2=104(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 12
LDI r2, 104
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
