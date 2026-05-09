; DESCRIPTION: Draws a cyan rectangle at (355, 32) with width 48 and height 18.
; PLAN: r0=355(x), r1=32(y), r2=48(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 32
LDI r2, 48
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
