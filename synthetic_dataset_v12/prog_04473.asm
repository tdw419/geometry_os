; DESCRIPTION: Draws a cyan rectangle at (233, 18) with width 32 and height 54.
; PLAN: r0=233(x), r1=18(y), r2=32(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 18
LDI r2, 32
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
