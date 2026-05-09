; DESCRIPTION: Composite: . Then Sets a single white pixel at (92, 142). Then Draws a black line from (213, 186) to (165, 165).
; PLAN: r0=92(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=213(x1), r1=186(y1), r2=165(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (92, 142).
; PLAN: r0=92(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 142
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (213, 186) to (165, 165).
; PLAN: r0=213(x1), r1=186(y1), r2=165(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 186
LDI r2, 165
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
