; DESCRIPTION: Composite: . Then Draws a cyan line from (66, 167) to (185, 247). Then Places a cyan circle of radius 34 at center (79, 159).
; PLAN: r0=66(x1), r1=167(y1), r2=185(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=79(x), r1=159(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (66, 167) to (185, 247).
; PLAN: r0=66(x1), r1=167(y1), r2=185(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 167
LDI r2, 185
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 34 at center (79, 159).
; PLAN: r0=79(x), r1=159(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 159
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
