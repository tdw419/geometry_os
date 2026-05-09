; DESCRIPTION: Draws a cyan rectangle at (215, 229) with width 15 and height 11.
; PLAN: r0=215(x), r1=229(y), r2=15(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 229
LDI r2, 15
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
