; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (88, 242). Then Draws a red rectangle at (135, 167) with width 108 and height 65.
; PLAN: r0=88(x), r1=242(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=135(x), r1=167(y), r2=108(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (88, 242).
; PLAN: r0=88(x), r1=242(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 242
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (135, 167) with width 108 and height 65.
; PLAN: r0=135(x), r1=167(y), r2=108(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 167
LDI r2, 108
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
