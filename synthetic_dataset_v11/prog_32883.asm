; DESCRIPTION: Composite: . Then Sets a single white pixel at (117, 182). Then Renders a yellow line between points (31, 111) and (47, 49).
; PLAN: r0=117(x), r1=182(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=31(x1), r1=111(y1), r2=47(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (117, 182).
; PLAN: r0=117(x), r1=182(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 182
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (31, 111) and (47, 49).
; PLAN: r0=31(x1), r1=111(y1), r2=47(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 111
LDI r2, 47
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
