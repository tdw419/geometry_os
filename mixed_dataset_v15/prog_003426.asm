; DESCRIPTION: Draws a cyan rectangle at (183, 167) with width 32 and height 59.
; PLAN: r0=183(x), r1=167(y), r2=32(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 167
LDI r2, 32
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
