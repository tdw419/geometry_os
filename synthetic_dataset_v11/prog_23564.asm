; DESCRIPTION: Composite: . Then Sets a single white pixel at (88, 243). Then Draws a white line from (10, 174) to (61, 144).
; PLAN: r0=88(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=10(x1), r1=174(y1), r2=61(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (88, 243).
; PLAN: r0=88(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 243
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (10, 174) to (61, 144).
; PLAN: r0=10(x1), r1=174(y1), r2=61(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 174
LDI r2, 61
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
