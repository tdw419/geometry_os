; DESCRIPTION: Composite: . Then Renders a cyan line between points (187, 235) and (113, 58). Then Sets a single white pixel at (5, 107).
; PLAN: r0=187(x1), r1=235(y1), r2=113(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=5(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (187, 235) and (113, 58).
; PLAN: r0=187(x1), r1=235(y1), r2=113(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 235
LDI r2, 113
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (5, 107).
; PLAN: r0=5(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
