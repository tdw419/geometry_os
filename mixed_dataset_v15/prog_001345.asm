; DESCRIPTION: Draws a yellow rectangle at (182, 163) with width 120 and height 21.
; PLAN: r0=182(x), r1=163(y), r2=120(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 163
LDI r2, 120
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
