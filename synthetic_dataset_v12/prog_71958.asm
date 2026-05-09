; DESCRIPTION: Draws a cyan rectangle at (315, 39) with width 76 and height 36.
; PLAN: r0=315(x), r1=39(y), r2=76(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 39
LDI r2, 76
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
