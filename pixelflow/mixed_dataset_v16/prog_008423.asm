; DESCRIPTION: Draws a cyan rectangle at (378, 64) with width 46 and height 14.
; PLAN: r0=378(x), r1=64(y), r2=46(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 64
LDI r2, 46
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
