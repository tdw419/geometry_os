; DESCRIPTION: Composite: . Then Renders a cyan line between points (176, 43) and (24, 33). Then Renders a red disk with center (141, 166) and radius 49.
; PLAN: r0=176(x1), r1=43(y1), r2=24(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=141(x), r1=166(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (176, 43) and (24, 33).
; PLAN: r0=176(x1), r1=43(y1), r2=24(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 43
LDI r2, 24
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (141, 166) and radius 49.
; PLAN: r0=141(x), r1=166(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 166
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
