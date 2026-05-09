; DESCRIPTION: Draws a yellow rectangle at (154, 173) with width 86 and height 82.
; PLAN: r0=154(x), r1=173(y), r2=86(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 173
LDI r2, 86
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
