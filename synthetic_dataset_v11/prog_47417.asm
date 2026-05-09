; DESCRIPTION: Composite: . Then Renders a green box of size 58x64 starting at (102, 75). Then Sets a single orange pixel at (232, 54).
; PLAN: r0=102(x), r1=75(y), r2=58(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=232(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 58x64 starting at (102, 75).
; PLAN: r0=102(x), r1=75(y), r2=58(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 75
LDI r2, 58
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (232, 54).
; PLAN: r0=232(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 54
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
