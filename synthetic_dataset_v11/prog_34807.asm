; DESCRIPTION: Composite: . Then Renders a cyan box of size 71x10 starting at (102, 48). Then Places a purple dot at position (85, 27).
; PLAN: r0=102(x), r1=48(y), r2=71(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=85(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 71x10 starting at (102, 48).
; PLAN: r0=102(x), r1=48(y), r2=71(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 48
LDI r2, 71
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (85, 27).
; PLAN: r0=85(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 27
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
