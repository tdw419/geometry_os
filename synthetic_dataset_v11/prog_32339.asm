; DESCRIPTION: Composite: . Then Sets a single white pixel at (12, 54). Then Renders a cyan box of size 58x88 starting at (49, 57).
; PLAN: r0=12(x), r1=54(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=49(x), r1=57(y), r2=58(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (12, 54).
; PLAN: r0=12(x), r1=54(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 54
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 58x88 starting at (49, 57).
; PLAN: r0=49(x), r1=57(y), r2=58(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 57
LDI r2, 58
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
