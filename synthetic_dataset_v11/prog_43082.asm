; DESCRIPTION: Composite: . Then Places a cyan circle of radius 61 at center (164, 101). Then Places a cyan line segment connecting (183, 180) to (6, 24).
; PLAN: r0=164(x), r1=101(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=183(x1), r1=180(y1), r2=6(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 61 at center (164, 101).
; PLAN: r0=164(x), r1=101(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 101
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (183, 180) to (6, 24).
; PLAN: r0=183(x1), r1=180(y1), r2=6(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 180
LDI r2, 6
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
