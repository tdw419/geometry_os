; DESCRIPTION: Draws a black rectangle at (47, 177) with width 42 and height 45.
; PLAN: r0=47(x), r1=177(y), r2=42(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 177
LDI r2, 42
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
