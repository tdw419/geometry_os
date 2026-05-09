; DESCRIPTION: Draws a cyan rectangle at (180, 109) with width 117 and height 38.
; PLAN: r0=180(x), r1=109(y), r2=117(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 109
LDI r2, 117
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
