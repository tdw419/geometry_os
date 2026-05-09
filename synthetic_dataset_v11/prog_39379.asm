; DESCRIPTION: Draws a cyan rectangle at (91, 5) with width 101 and height 120.
; PLAN: r0=91(x), r1=5(y), r2=101(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 5
LDI r2, 101
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
