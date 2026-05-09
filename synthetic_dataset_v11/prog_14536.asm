; DESCRIPTION: Composite: . Then Renders a blue box of size 53x81 starting at (71, 157). Then Sets a single purple pixel at (25, 198).
; PLAN: r0=71(x), r1=157(y), r2=53(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=25(x), r1=198(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 53x81 starting at (71, 157).
; PLAN: r0=71(x), r1=157(y), r2=53(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 157
LDI r2, 53
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (25, 198).
; PLAN: r0=25(x), r1=198(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 198
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
