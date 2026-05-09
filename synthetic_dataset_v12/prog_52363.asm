; DESCRIPTION: Draws a cyan rectangle at (141, 16) with width 28 and height 28.
; PLAN: r0=141(x), r1=16(y), r2=28(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 16
LDI r2, 28
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
