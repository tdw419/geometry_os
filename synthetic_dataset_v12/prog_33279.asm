; DESCRIPTION: Draws a green rectangle at (374, 10) with width 70 and height 82.
; PLAN: r0=374(x), r1=10(y), r2=70(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 10
LDI r2, 70
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
