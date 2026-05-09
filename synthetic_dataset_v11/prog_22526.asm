; DESCRIPTION: Renders a cyan line between points (104, 24) and (150, 31).
; PLAN: r0=104(x1), r1=24(y1), r2=150(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 24
LDI r2, 150
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
