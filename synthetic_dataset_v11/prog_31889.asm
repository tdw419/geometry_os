; DESCRIPTION: Draws a cyan rectangle at (58, 20) with width 32 and height 80.
; PLAN: r0=58(x), r1=20(y), r2=32(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 20
LDI r2, 32
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
