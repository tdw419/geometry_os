; DESCRIPTION: Composite: . Then Sets a single orange pixel at (247, 211). Then Renders a red box of size 99x29 starting at (45, 215).
; PLAN: r0=247(x), r1=211(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=45(x), r1=215(y), r2=99(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (247, 211).
; PLAN: r0=247(x), r1=211(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 211
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 99x29 starting at (45, 215).
; PLAN: r0=45(x), r1=215(y), r2=99(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 215
LDI r2, 99
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
