; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (41, 129) with width 99 and height 76. Then Sets a single cyan pixel at (63, 31).
; PLAN: r0=41(x), r1=129(y), r2=99(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=63(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (41, 129) with width 99 and height 76.
; PLAN: r0=41(x), r1=129(y), r2=99(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 129
LDI r2, 99
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (63, 31).
; PLAN: r0=63(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 31
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
