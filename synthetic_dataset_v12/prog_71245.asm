; DESCRIPTION: Draws a cyan rectangle at (138, 139) with width 32 and height 44.
; PLAN: r0=138(x), r1=139(y), r2=32(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 139
LDI r2, 32
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
