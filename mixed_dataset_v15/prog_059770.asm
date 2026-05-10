; DESCRIPTION: Draws a orange rectangle at (242, 147) with width 119 and height 34.
; PLAN: r0=242(x), r1=147(y), r2=119(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 147
LDI r2, 119
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
