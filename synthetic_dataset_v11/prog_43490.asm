; DESCRIPTION: Composite: . Then Places a purple circle of radius 29 at center (167, 46). Then Sets a single cyan pixel at (121, 252).
; PLAN: r0=167(x), r1=46(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 29 at center (167, 46).
; PLAN: r0=167(x), r1=46(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 46
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (121, 252).
; PLAN: r0=121(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 252
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
