; DESCRIPTION: Draws a green rectangle at (134, 60) with width 16 and height 120.
; PLAN: r0=134(x), r1=60(y), r2=16(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 60
LDI r2, 16
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
