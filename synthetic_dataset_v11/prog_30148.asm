; DESCRIPTION: Composite: . Then Renders a green disk with center (95, 160) and radius 47. Then Sets a single cyan pixel at (124, 169).
; PLAN: r0=95(x), r1=160(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=124(x), r1=169(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green disk with center (95, 160) and radius 47.
; PLAN: r0=95(x), r1=160(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 160
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (124, 169).
; PLAN: r0=124(x), r1=169(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 169
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
