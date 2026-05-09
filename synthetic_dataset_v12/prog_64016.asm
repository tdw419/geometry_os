; DESCRIPTION: Draws a cyan rectangle at (131, 109) with width 85 and height 28.
; PLAN: r0=131(x), r1=109(y), r2=85(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 109
LDI r2, 85
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
