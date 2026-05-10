; DESCRIPTION: Draws a cyan rectangle at (316, 173) with width 76 and height 79.
; PLAN: r0=316(x), r1=173(y), r2=76(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 173
LDI r2, 76
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
