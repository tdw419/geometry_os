; DESCRIPTION: Draws a cyan rectangle at (64, 25) with width 40 and height 115.
; PLAN: r0=64(x), r1=25(y), r2=40(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 25
LDI r2, 40
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
