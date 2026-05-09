; DESCRIPTION: Composite: . Then Renders a yellow box of size 64x41 starting at (7, 157). Then Sets a single magenta pixel at (109, 133).
; PLAN: r0=7(x), r1=157(y), r2=64(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=109(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 64x41 starting at (7, 157).
; PLAN: r0=7(x), r1=157(y), r2=64(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 157
LDI r2, 64
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (109, 133).
; PLAN: r0=109(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
