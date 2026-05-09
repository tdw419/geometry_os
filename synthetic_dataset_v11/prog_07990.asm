; DESCRIPTION: Draws a red rectangle at (193, 2) with width 11 and height 32.
; PLAN: r0=193(x), r1=2(y), r2=11(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 2
LDI r2, 11
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
