; DESCRIPTION: Composite: . Then Renders a yellow box of size 24x57 starting at (161, 41). Then Sets a single yellow pixel at (16, 112).
; PLAN: r0=161(x), r1=41(y), r2=24(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=16(x), r1=112(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 24x57 starting at (161, 41).
; PLAN: r0=161(x), r1=41(y), r2=24(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 41
LDI r2, 24
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (16, 112).
; PLAN: r0=16(x), r1=112(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 112
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
