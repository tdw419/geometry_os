; DESCRIPTION: Composite: . Then Draws a cyan line from (246, 172) to (138, 176). Then Creates a cyan circular shape at (58, 191) with radius 34.
; PLAN: r0=246(x1), r1=172(y1), r2=138(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=58(x), r1=191(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (246, 172) to (138, 176).
; PLAN: r0=246(x1), r1=172(y1), r2=138(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 172
LDI r2, 138
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (58, 191) with radius 34.
; PLAN: r0=58(x), r1=191(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 191
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
