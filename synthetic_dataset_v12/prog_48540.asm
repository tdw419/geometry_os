; DESCRIPTION: Draws a cyan rectangle at (215, 57) with width 52 and height 60.
; PLAN: r0=215(x), r1=57(y), r2=52(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 57
LDI r2, 52
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
