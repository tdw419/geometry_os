; DESCRIPTION: Draws a red rectangle at (229, 64) with width 27 and height 56.
; PLAN: r0=229(x), r1=64(y), r2=27(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 64
LDI r2, 27
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
