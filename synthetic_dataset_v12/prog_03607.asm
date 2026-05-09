; DESCRIPTION: Draws a cyan rectangle at (304, 4) with width 30 and height 28.
; PLAN: r0=304(x), r1=4(y), r2=30(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 4
LDI r2, 30
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
