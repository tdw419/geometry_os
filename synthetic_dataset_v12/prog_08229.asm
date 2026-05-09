; DESCRIPTION: Draws a yellow rectangle at (242, 24) with width 102 and height 58.
; PLAN: r0=242(x), r1=24(y), r2=102(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 24
LDI r2, 102
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
