; DESCRIPTION: Draws a black rectangle at (305, 100) with width 64 and height 72.
; PLAN: r0=305(x), r1=100(y), r2=64(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 100
LDI r2, 64
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
