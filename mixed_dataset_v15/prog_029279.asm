; DESCRIPTION: Draws a red rectangle at (479, 29) with width 16 and height 78.
; PLAN: r0=479(x), r1=29(y), r2=16(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 29
LDI r2, 16
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
