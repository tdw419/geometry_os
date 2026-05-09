; DESCRIPTION: Draws a cyan rectangle at (10, 33) with width 19 and height 32.
; PLAN: r0=10(x), r1=33(y), r2=19(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 33
LDI r2, 19
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
