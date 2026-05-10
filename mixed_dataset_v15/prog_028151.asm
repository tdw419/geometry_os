; DESCRIPTION: Renders a cyan line between points (107, 109) and (90, 106).
; PLAN: r0=107(x1), r1=109(y1), r2=90(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 109
LDI r2, 90
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
