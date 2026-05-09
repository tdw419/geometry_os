; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (121, 162) with radius 46. Then Places a red dot at position (73, 179).
; PLAN: r0=121(x), r1=162(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=73(x), r1=179(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (121, 162) with radius 46.
; PLAN: r0=121(x), r1=162(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 162
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (73, 179).
; PLAN: r0=73(x), r1=179(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 179
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
