; DESCRIPTION: Renders a cyan line between points (103, 104) and (443, 109).
; PLAN: r0=103(x1), r1=104(y1), r2=443(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 104
LDI r2, 443
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
