; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (192, 122) with width 42 and height 88. Then Sets a single cyan pixel at (135, 253).
; PLAN: r0=192(x), r1=122(y), r2=42(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=135(x), r1=253(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (192, 122) with width 42 and height 88.
; PLAN: r0=192(x), r1=122(y), r2=42(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 122
LDI r2, 42
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (135, 253).
; PLAN: r0=135(x), r1=253(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 253
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
