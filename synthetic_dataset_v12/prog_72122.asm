; DESCRIPTION: Draws a black rectangle at (168, 0) with width 120 and height 92.
; PLAN: r0=168(x), r1=0(y), r2=120(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 0
LDI r2, 120
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
