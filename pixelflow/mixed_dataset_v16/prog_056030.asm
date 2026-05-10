; DESCRIPTION: Draws a orange rectangle at (215, 7) with width 103 and height 34.
; PLAN: r0=215(x), r1=7(y), r2=103(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 7
LDI r2, 103
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
