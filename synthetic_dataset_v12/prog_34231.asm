; DESCRIPTION: Draws a yellow rectangle at (374, 53) with width 98 and height 66.
; PLAN: r0=374(x), r1=53(y), r2=98(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 53
LDI r2, 98
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
