; DESCRIPTION: Draws a cyan rectangle at (161, 126) with width 32 and height 96.
; PLAN: r0=161(x), r1=126(y), r2=32(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 126
LDI r2, 32
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
