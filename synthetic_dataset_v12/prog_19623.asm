; DESCRIPTION: Draws a cyan rectangle at (263, 89) with width 25 and height 61.
; PLAN: r0=263(x), r1=89(y), r2=25(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 89
LDI r2, 25
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
