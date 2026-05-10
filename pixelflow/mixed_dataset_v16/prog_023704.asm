; DESCRIPTION: Draws a yellow rectangle at (242, 59) with width 86 and height 92.
; PLAN: r0=242(x), r1=59(y), r2=86(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 59
LDI r2, 86
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
