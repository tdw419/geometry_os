; DESCRIPTION: Draws a cyan rectangle at (396, 48) with width 116 and height 100.
; PLAN: r0=396(x), r1=48(y), r2=116(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 48
LDI r2, 116
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
