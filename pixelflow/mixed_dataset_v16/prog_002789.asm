; DESCRIPTION: Draws a red rectangle at (242, 28) with width 84 and height 112.
; PLAN: r0=242(x), r1=28(y), r2=84(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 28
LDI r2, 84
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
