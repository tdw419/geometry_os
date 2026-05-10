; DESCRIPTION: Draws a cyan rectangle at (64, 70) with width 91 and height 112.
; PLAN: r0=64(x), r1=70(y), r2=91(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 70
LDI r2, 91
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
