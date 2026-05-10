; DESCRIPTION: Draws a cyan rectangle at (265, 49) with width 58 and height 71.
; PLAN: r0=265(x), r1=49(y), r2=58(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 49
LDI r2, 58
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
