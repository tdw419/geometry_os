; DESCRIPTION: Draws a black rectangle at (201, 177) with width 36 and height 42.
; PLAN: r0=201(x), r1=177(y), r2=36(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 177
LDI r2, 36
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
