; DESCRIPTION: Draws a cyan rectangle at (40, 50) with width 72 and height 75.
; PLAN: r0=40(x), r1=50(y), r2=72(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 50
LDI r2, 72
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
