; DESCRIPTION: Draws a cyan rectangle at (365, 8) with width 103 and height 69.
; PLAN: r0=365(x), r1=8(y), r2=103(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 8
LDI r2, 103
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
