; DESCRIPTION: Draws a cyan rectangle at (405, 8) with width 38 and height 37.
; PLAN: r0=405(x), r1=8(y), r2=38(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 8
LDI r2, 38
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
