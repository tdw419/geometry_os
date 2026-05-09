; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (178, 138). Then Draws a black line from (238, 53) to (29, 21).
; PLAN: r0=178(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=238(x1), r1=53(y1), r2=29(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (178, 138).
; PLAN: r0=178(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 138
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (238, 53) to (29, 21).
; PLAN: r0=238(x1), r1=53(y1), r2=29(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 53
LDI r2, 29
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
