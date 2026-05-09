; DESCRIPTION: Draws a cyan rectangle at (161, 186) with width 71 and height 61.
; PLAN: r0=161(x), r1=186(y), r2=71(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 186
LDI r2, 71
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
