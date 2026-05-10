; DESCRIPTION: Renders a cyan line between points (172, 134) and (391, 126).
; PLAN: r0=172(x1), r1=134(y1), r2=391(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 134
LDI r2, 391
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
