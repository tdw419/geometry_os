; DESCRIPTION: Draws a white rectangle at (374, 50) with width 28 and height 87.
; PLAN: r0=374(x), r1=50(y), r2=28(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 50
LDI r2, 28
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
