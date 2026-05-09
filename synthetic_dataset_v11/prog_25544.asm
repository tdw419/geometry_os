; DESCRIPTION: Draws a cyan rectangle at (58, 207) with width 70 and height 32.
; PLAN: r0=58(x), r1=207(y), r2=70(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 207
LDI r2, 70
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
