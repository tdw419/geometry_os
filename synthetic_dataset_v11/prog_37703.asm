; DESCRIPTION: Renders a cyan line between points (246, 23) and (43, 86).
; PLAN: r0=246(x1), r1=23(y1), r2=43(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 23
LDI r2, 43
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
