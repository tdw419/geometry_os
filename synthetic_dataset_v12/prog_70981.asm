; DESCRIPTION: Draws a red rectangle at (264, 115) with width 30 and height 120.
; PLAN: r0=264(x), r1=115(y), r2=30(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 115
LDI r2, 30
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
