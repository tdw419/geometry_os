; DESCRIPTION: Draws a cyan rectangle at (289, 60) with width 79 and height 100.
; PLAN: r0=289(x), r1=60(y), r2=79(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 60
LDI r2, 79
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
