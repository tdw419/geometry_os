; DESCRIPTION: Draws a cyan rectangle at (237, 178) with width 113 and height 21.
; PLAN: r0=237(x), r1=178(y), r2=113(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 178
LDI r2, 113
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
