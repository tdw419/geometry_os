; DESCRIPTION: Draws a cyan rectangle at (263, 75) with width 68 and height 57.
; PLAN: r0=263(x), r1=75(y), r2=68(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 75
LDI r2, 68
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
