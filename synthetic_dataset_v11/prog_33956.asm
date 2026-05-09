; DESCRIPTION: Composite: . Then Places a white line segment connecting (246, 50) to (1, 28). Then Sets a single white pixel at (30, 47).
; PLAN: r0=246(x1), r1=50(y1), r2=1(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=30(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (246, 50) to (1, 28).
; PLAN: r0=246(x1), r1=50(y1), r2=1(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 50
LDI r2, 1
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (30, 47).
; PLAN: r0=30(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 47
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
