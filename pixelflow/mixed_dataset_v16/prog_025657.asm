; DESCRIPTION: Draws a cyan rectangle at (411, 3) with width 94 and height 58.
; PLAN: r0=411(x), r1=3(y), r2=94(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 3
LDI r2, 94
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
