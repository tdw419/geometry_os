; DESCRIPTION: Composite: . Then Sets a single white pixel at (194, 130). Then Renders a yellow line between points (140, 224) and (239, 76).
; PLAN: r0=194(x), r1=130(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=140(x1), r1=224(y1), r2=239(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (194, 130).
; PLAN: r0=194(x), r1=130(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 130
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (140, 224) and (239, 76).
; PLAN: r0=140(x1), r1=224(y1), r2=239(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 224
LDI r2, 239
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
