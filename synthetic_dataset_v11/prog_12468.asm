; DESCRIPTION: Composite: . Then Sets a single white pixel at (177, 239). Then Draws a green line from (82, 103) to (251, 25).
; PLAN: r0=177(x), r1=239(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=82(x1), r1=103(y1), r2=251(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (177, 239).
; PLAN: r0=177(x), r1=239(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 239
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (82, 103) to (251, 25).
; PLAN: r0=82(x1), r1=103(y1), r2=251(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 103
LDI r2, 251
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
