; DESCRIPTION: Draws a red rectangle at (200, 28) with width 48 and height 93.
; PLAN: r0=200(x), r1=28(y), r2=48(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 28
LDI r2, 48
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
