; DESCRIPTION: Draws a yellow rectangle at (413, 42) with width 39 and height 54.
; PLAN: r0=413(x), r1=42(y), r2=39(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 42
LDI r2, 39
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
