; DESCRIPTION: Draws a cyan rectangle at (142, 135) with width 87 and height 98.
; PLAN: r0=142(x), r1=135(y), r2=87(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 135
LDI r2, 87
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
