; DESCRIPTION: Draws a cyan rectangle at (111, 5) with width 75 and height 16.
; PLAN: r0=111(x), r1=5(y), r2=75(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 5
LDI r2, 75
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
