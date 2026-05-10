; DESCRIPTION: Draws a yellow rectangle at (64, 98) with width 16 and height 109.
; PLAN: r0=64(x), r1=98(y), r2=16(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 98
LDI r2, 16
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
