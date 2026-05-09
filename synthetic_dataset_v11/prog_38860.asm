; DESCRIPTION: Composite: . Then Renders a white line between points (25, 189) and (57, 95). Then Sets a single white pixel at (224, 202).
; PLAN: r0=25(x1), r1=189(y1), r2=57(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=224(x), r1=202(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (25, 189) and (57, 95).
; PLAN: r0=25(x1), r1=189(y1), r2=57(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 189
LDI r2, 57
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (224, 202).
; PLAN: r0=224(x), r1=202(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 202
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
