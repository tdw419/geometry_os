; DESCRIPTION: Draws a cyan rectangle at (277, 36) with width 88 and height 107.
; PLAN: r0=277(x), r1=36(y), r2=88(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 36
LDI r2, 88
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
