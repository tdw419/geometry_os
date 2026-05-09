; DESCRIPTION: Draws a cyan rectangle at (180, 89) with width 32 and height 25.
; PLAN: r0=180(x), r1=89(y), r2=32(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 89
LDI r2, 32
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
