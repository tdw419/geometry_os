; DESCRIPTION: Composite: . Then Draws a red circle centered at (177, 126) with radius 53. Then Renders a cyan line between points (60, 227) and (199, 26).
; PLAN: r0=177(x), r1=126(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=60(x1), r1=227(y1), r2=199(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (177, 126) with radius 53.
; PLAN: r0=177(x), r1=126(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 126
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (60, 227) and (199, 26).
; PLAN: r0=60(x1), r1=227(y1), r2=199(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 227
LDI r2, 199
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
