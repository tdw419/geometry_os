; DESCRIPTION: Draws a black rectangle at (190, 120) with width 32 and height 98.
; PLAN: r0=190(x), r1=120(y), r2=32(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 120
LDI r2, 32
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
