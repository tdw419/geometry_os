; DESCRIPTION: Draws a cyan rectangle at (240, 197) with width 63 and height 49.
; PLAN: r0=240(x), r1=197(y), r2=63(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 197
LDI r2, 63
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
