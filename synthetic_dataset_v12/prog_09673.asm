; DESCRIPTION: Draws a red rectangle at (405, 139) with width 27 and height 64.
; PLAN: r0=405(x), r1=139(y), r2=27(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 139
LDI r2, 27
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
