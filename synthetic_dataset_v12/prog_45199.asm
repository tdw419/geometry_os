; DESCRIPTION: Renders a cyan line between points (193, 163) and (281, 205).
; PLAN: r0=193(x1), r1=163(y1), r2=281(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 163
LDI r2, 281
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
