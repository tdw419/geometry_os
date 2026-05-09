; DESCRIPTION: Composite: . Then Sets a single black pixel at (211, 209). Then Renders a cyan line between points (28, 52) and (220, 152).
; PLAN: r0=211(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=28(x1), r1=52(y1), r2=220(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (211, 209).
; PLAN: r0=211(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 209
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (28, 52) and (220, 152).
; PLAN: r0=28(x1), r1=52(y1), r2=220(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 52
LDI r2, 220
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
