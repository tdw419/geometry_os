; DESCRIPTION: Draws a orange rectangle at (62, 93) with width 94 and height 48.
; PLAN: r0=62(x), r1=93(y), r2=94(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 93
LDI r2, 94
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
