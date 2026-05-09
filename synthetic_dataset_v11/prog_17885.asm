; DESCRIPTION: Composite: . Then Renders a blue box of size 43x68 starting at (107, 94). Then Sets a single orange pixel at (128, 54).
; PLAN: r0=107(x), r1=94(y), r2=43(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=128(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 43x68 starting at (107, 94).
; PLAN: r0=107(x), r1=94(y), r2=43(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 94
LDI r2, 43
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (128, 54).
; PLAN: r0=128(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 54
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
