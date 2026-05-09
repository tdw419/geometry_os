; DESCRIPTION: Draws a cyan line from (496, 50) to (309, 93).
; PLAN: r0=496(x1), r1=50(y1), r2=309(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 50
LDI r2, 309
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
