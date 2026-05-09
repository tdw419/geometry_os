; DESCRIPTION: Draws a cyan rectangle at (308, 123) with width 53 and height 57.
; PLAN: r0=308(x), r1=123(y), r2=53(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 123
LDI r2, 53
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
