; DESCRIPTION: Draws a cyan rectangle at (320, 153) with width 61 and height 12.
; PLAN: r0=320(x), r1=153(y), r2=61(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 153
LDI r2, 61
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
