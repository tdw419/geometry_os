; DESCRIPTION: Draws a cyan rectangle at (142, 97) with width 32 and height 22.
; PLAN: r0=142(x), r1=97(y), r2=32(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 97
LDI r2, 32
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
