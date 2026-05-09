; DESCRIPTION: Draws a yellow rectangle at (288, 228) with width 47 and height 16.
; PLAN: r0=288(x), r1=228(y), r2=47(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 228
LDI r2, 47
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
