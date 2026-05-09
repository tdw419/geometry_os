; DESCRIPTION: Draws a cyan rectangle at (118, 121) with width 93 and height 46.
; PLAN: r0=118(x), r1=121(y), r2=93(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 121
LDI r2, 93
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
