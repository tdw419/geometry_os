; DESCRIPTION: Draws a cyan rectangle at (259, 120) with width 85 and height 20.
; PLAN: r0=259(x), r1=120(y), r2=85(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 120
LDI r2, 85
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
