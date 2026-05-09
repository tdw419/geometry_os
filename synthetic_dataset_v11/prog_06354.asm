; DESCRIPTION: Composite: . Then Renders a red line between points (198, 3) and (234, 96). Then Sets a single white pixel at (235, 164).
; PLAN: r0=198(x1), r1=3(y1), r2=234(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=235(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red line between points (198, 3) and (234, 96).
; PLAN: r0=198(x1), r1=3(y1), r2=234(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 3
LDI r2, 234
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (235, 164).
; PLAN: r0=235(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 164
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
