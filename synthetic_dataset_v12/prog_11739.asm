; DESCRIPTION: Draws a cyan rectangle at (331, 202) with width 81 and height 14.
; PLAN: r0=331(x), r1=202(y), r2=81(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 202
LDI r2, 81
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
