; DESCRIPTION: Draws a green rectangle at (152, 64) with width 120 and height 105.
; PLAN: r0=152(x), r1=64(y), r2=120(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 64
LDI r2, 120
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
