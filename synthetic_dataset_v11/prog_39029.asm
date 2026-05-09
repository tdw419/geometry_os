; DESCRIPTION: Composite: . Then Renders a black box of size 88x95 starting at (34, 10). Then Sets a single orange pixel at (100, 71).
; PLAN: r0=34(x), r1=10(y), r2=88(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=100(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 88x95 starting at (34, 10).
; PLAN: r0=34(x), r1=10(y), r2=88(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 10
LDI r2, 88
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (100, 71).
; PLAN: r0=100(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 71
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
