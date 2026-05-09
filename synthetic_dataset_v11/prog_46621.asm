; DESCRIPTION: Composite: . Then Sets a single orange pixel at (45, 94). Then Renders a green box of size 65x13 starting at (36, 172).
; PLAN: r0=45(x), r1=94(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=36(x), r1=172(y), r2=65(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (45, 94).
; PLAN: r0=45(x), r1=94(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 94
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 65x13 starting at (36, 172).
; PLAN: r0=36(x), r1=172(y), r2=65(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 172
LDI r2, 65
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
