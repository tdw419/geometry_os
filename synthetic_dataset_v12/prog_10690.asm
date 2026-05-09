; DESCRIPTION: Draws a magenta rectangle at (242, 137) with width 91 and height 14.
; PLAN: r0=242(x), r1=137(y), r2=91(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 137
LDI r2, 91
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
