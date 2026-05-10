; DESCRIPTION: Draws a cyan rectangle at (59, 121) with width 34 and height 68.
; PLAN: r0=59(x), r1=121(y), r2=34(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 121
LDI r2, 34
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
