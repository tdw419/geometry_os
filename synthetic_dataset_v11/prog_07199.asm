; DESCRIPTION: Draws a cyan rectangle at (70, 95) with width 32 and height 91.
; PLAN: r0=70(x), r1=95(y), r2=32(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 95
LDI r2, 32
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
