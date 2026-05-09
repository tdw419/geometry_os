; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (196, 168). Then Renders a purple box of size 105x28 starting at (53, 220).
; PLAN: r0=196(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=53(x), r1=220(y), r2=105(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (196, 168).
; PLAN: r0=196(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 168
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple box of size 105x28 starting at (53, 220).
; PLAN: r0=53(x), r1=220(y), r2=105(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 220
LDI r2, 105
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
