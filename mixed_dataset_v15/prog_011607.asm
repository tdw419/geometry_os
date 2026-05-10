; DESCRIPTION: Draws a cyan rectangle at (408, 196) with width 50 and height 15.
; PLAN: r0=408(x), r1=196(y), r2=50(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 196
LDI r2, 50
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
