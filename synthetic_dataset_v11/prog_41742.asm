; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (178, 114). Then Draws a black line from (253, 175) to (218, 234).
; PLAN: r0=178(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=253(x1), r1=175(y1), r2=218(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (178, 114).
; PLAN: r0=178(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (253, 175) to (218, 234).
; PLAN: r0=253(x1), r1=175(y1), r2=218(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 175
LDI r2, 218
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
