; DESCRIPTION: Draws a yellow rectangle at (365, 24) with width 32 and height 44.
; PLAN: r0=365(x), r1=24(y), r2=32(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 24
LDI r2, 32
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
