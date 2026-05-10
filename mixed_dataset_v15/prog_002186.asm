; DESCRIPTION: Renders a red line between points (268, 104) and (231, 86).
; PLAN: r0=268(x1), r1=104(y1), r2=231(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 104
LDI r2, 231
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
