; DESCRIPTION: Draws a cyan rectangle at (140, 21) with width 28 and height 89.
; PLAN: r0=140(x), r1=21(y), r2=28(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 21
LDI r2, 28
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
