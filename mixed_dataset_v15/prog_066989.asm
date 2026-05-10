; DESCRIPTION: Draws a orange rectangle at (40, 168) with width 92 and height 73.
; PLAN: r0=40(x), r1=168(y), r2=92(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 168
LDI r2, 92
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
