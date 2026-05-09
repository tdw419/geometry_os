; DESCRIPTION: Composite: . Then Sets a single black pixel at (72, 217). Then Renders a cyan line between points (206, 177) and (48, 239).
; PLAN: r0=72(x), r1=217(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=206(x1), r1=177(y1), r2=48(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (72, 217).
; PLAN: r0=72(x), r1=217(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 217
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (206, 177) and (48, 239).
; PLAN: r0=206(x1), r1=177(y1), r2=48(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 177
LDI r2, 48
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
