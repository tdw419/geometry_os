; DESCRIPTION: Draws a red rectangle at (374, 106) with width 65 and height 59.
; PLAN: r0=374(x), r1=106(y), r2=65(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 106
LDI r2, 65
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
