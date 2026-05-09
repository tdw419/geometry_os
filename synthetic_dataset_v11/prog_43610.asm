; DESCRIPTION: Composite: . Then Places a cyan circle of radius 40 at center (93, 203). Then Draws a cyan line from (29, 148) to (208, 157).
; PLAN: r0=93(x), r1=203(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=29(x1), r1=148(y1), r2=208(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 40 at center (93, 203).
; PLAN: r0=93(x), r1=203(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 203
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (29, 148) to (208, 157).
; PLAN: r0=29(x1), r1=148(y1), r2=208(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 148
LDI r2, 208
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
