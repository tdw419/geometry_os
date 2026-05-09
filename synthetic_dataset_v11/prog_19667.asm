; DESCRIPTION: Composite: . Then Places a black dot at position (156, 2). Then Renders a red box of size 29x64 starting at (134, 71).
; PLAN: r0=156(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=134(x), r1=71(y), r2=29(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (156, 2).
; PLAN: r0=156(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 2
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 29x64 starting at (134, 71).
; PLAN: r0=134(x), r1=71(y), r2=29(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 71
LDI r2, 29
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
