; DESCRIPTION: Draws a cyan rectangle at (262, 53) with width 20 and height 35.
; PLAN: r0=262(x), r1=53(y), r2=20(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 53
LDI r2, 20
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
