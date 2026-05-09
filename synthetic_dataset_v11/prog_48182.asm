; DESCRIPTION: Draws a cyan rectangle at (47, 128) with width 61 and height 117.
; PLAN: r0=47(x), r1=128(y), r2=61(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 128
LDI r2, 61
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
