; DESCRIPTION: Composite: . Then Renders a cyan line between points (239, 168) and (141, 166). Then Draws a black circle centered at (124, 125) with radius 75.
; PLAN: r0=239(x1), r1=168(y1), r2=141(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=124(x), r1=125(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (239, 168) and (141, 166).
; PLAN: r0=239(x1), r1=168(y1), r2=141(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 168
LDI r2, 141
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (124, 125) with radius 75.
; PLAN: r0=124(x), r1=125(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 125
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
