; DESCRIPTION: Renders a cyan line between points (103, 159) and (272, 251).
; PLAN: r0=103(x1), r1=159(y1), r2=272(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 159
LDI r2, 272
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
