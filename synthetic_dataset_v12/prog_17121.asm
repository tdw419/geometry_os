; DESCRIPTION: Draws a red rectangle at (82, 160) with width 99 and height 28.
; PLAN: r0=82(x), r1=160(y), r2=99(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 160
LDI r2, 99
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
