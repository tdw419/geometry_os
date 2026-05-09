; DESCRIPTION: Draws a cyan rectangle at (250, 25) with width 60 and height 28.
; PLAN: r0=250(x), r1=25(y), r2=60(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 25
LDI r2, 60
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
