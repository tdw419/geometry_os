; DESCRIPTION: Composite: . Then Draws a yellow line from (151, 17) to (26, 138). Then Sets a single white pixel at (186, 53).
; PLAN: r0=151(x1), r1=17(y1), r2=26(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=186(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (151, 17) to (26, 138).
; PLAN: r0=151(x1), r1=17(y1), r2=26(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 17
LDI r2, 26
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (186, 53).
; PLAN: r0=186(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 53
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
