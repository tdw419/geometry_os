; DESCRIPTION: Composite: . Then Sets a single white pixel at (171, 93). Then Draws a green line from (213, 145) to (128, 97).
; PLAN: r0=171(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=213(x1), r1=145(y1), r2=128(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (171, 93).
; PLAN: r0=171(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (213, 145) to (128, 97).
; PLAN: r0=213(x1), r1=145(y1), r2=128(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 145
LDI r2, 128
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
