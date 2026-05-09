; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (237, 184). Then Draws a orange rectangle at (31, 27) with width 82 and height 27.
; PLAN: r0=237(x), r1=184(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=31(x), r1=27(y), r2=82(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (237, 184).
; PLAN: r0=237(x), r1=184(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 184
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (31, 27) with width 82 and height 27.
; PLAN: r0=31(x), r1=27(y), r2=82(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 27
LDI r2, 82
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
