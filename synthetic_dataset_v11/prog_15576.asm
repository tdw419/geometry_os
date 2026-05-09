; DESCRIPTION: Draws a cyan rectangle at (54, 26) with width 103 and height 107.
; PLAN: r0=54(x), r1=26(y), r2=103(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 26
LDI r2, 103
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
