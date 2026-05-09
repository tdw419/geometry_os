; DESCRIPTION: Composite: . Then Sets a single white pixel at (168, 34). Then Renders a white line between points (175, 3) and (49, 101).
; PLAN: r0=168(x), r1=34(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=175(x1), r1=3(y1), r2=49(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (168, 34).
; PLAN: r0=168(x), r1=34(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 34
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (175, 3) and (49, 101).
; PLAN: r0=175(x1), r1=3(y1), r2=49(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 3
LDI r2, 49
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
