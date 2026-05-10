; DESCRIPTION: Draws a cyan rectangle at (36, 75) with width 28 and height 120.
; PLAN: r0=36(x), r1=75(y), r2=28(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 75
LDI r2, 28
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
