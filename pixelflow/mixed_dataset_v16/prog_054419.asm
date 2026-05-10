; DESCRIPTION: Draws a cyan rectangle at (284, 96) with width 78 and height 16.
; PLAN: r0=284(x), r1=96(y), r2=78(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 96
LDI r2, 78
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
