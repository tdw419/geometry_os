; DESCRIPTION: Draws a cyan rectangle at (123, 121) with width 109 and height 31.
; PLAN: r0=123(x), r1=121(y), r2=109(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 121
LDI r2, 109
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
