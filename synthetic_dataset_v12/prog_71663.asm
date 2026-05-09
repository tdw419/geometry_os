; DESCRIPTION: Draws a green rectangle at (245, 192) with width 42 and height 36.
; PLAN: r0=245(x), r1=192(y), r2=42(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 192
LDI r2, 42
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
