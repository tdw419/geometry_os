; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (48, 86) with width 94 and height 76. Then Sets a single orange pixel at (60, 186).
; PLAN: r0=48(x), r1=86(y), r2=94(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=60(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow rectangle at (48, 86) with width 94 and height 76.
; PLAN: r0=48(x), r1=86(y), r2=94(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 86
LDI r2, 94
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (60, 186).
; PLAN: r0=60(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
