; DESCRIPTION: Draws a cyan rectangle at (356, 160) with width 116 and height 21.
; PLAN: r0=356(x), r1=160(y), r2=116(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 160
LDI r2, 116
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
