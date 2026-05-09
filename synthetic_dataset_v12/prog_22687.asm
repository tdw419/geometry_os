; DESCRIPTION: Draws a cyan rectangle at (347, 48) with width 77 and height 67.
; PLAN: r0=347(x), r1=48(y), r2=77(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 48
LDI r2, 77
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
