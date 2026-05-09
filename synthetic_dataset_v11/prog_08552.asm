; DESCRIPTION: Draws a cyan rectangle at (95, 15) with width 77 and height 16.
; PLAN: r0=95(x), r1=15(y), r2=77(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 15
LDI r2, 77
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
