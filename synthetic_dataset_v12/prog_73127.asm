; DESCRIPTION: Draws a yellow rectangle at (221, 129) with width 117 and height 101.
; PLAN: r0=221(x), r1=129(y), r2=117(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 129
LDI r2, 117
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
