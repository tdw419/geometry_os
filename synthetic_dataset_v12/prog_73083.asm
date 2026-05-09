; DESCRIPTION: Renders a cyan line between points (286, 150) and (338, 93).
; PLAN: r0=286(x1), r1=150(y1), r2=338(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 150
LDI r2, 338
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
