; DESCRIPTION: Composite: . Then Renders a purple disk with center (87, 97) and radius 43. Then Draws a cyan line from (109, 134) to (24, 86).
; PLAN: r0=87(x), r1=97(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=109(x1), r1=134(y1), r2=24(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (87, 97) and radius 43.
; PLAN: r0=87(x), r1=97(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 97
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (109, 134) to (24, 86).
; PLAN: r0=109(x1), r1=134(y1), r2=24(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 134
LDI r2, 24
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
