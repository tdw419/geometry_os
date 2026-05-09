; DESCRIPTION: Composite: . Then Renders a black line between points (27, 25) and (48, 50). Then Sets a single white pixel at (107, 28).
; PLAN: r0=27(x1), r1=25(y1), r2=48(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=107(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (27, 25) and (48, 50).
; PLAN: r0=27(x1), r1=25(y1), r2=48(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 25
LDI r2, 48
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (107, 28).
; PLAN: r0=107(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 28
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
