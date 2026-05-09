; DESCRIPTION: Renders a cyan line between points (391, 75) and (342, 159).
; PLAN: r0=391(x1), r1=75(y1), r2=342(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 75
LDI r2, 342
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
