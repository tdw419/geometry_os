; DESCRIPTION: Draws a cyan rectangle at (124, 184) with width 72 and height 64.
; PLAN: r0=124(x), r1=184(y), r2=72(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 184
LDI r2, 72
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
