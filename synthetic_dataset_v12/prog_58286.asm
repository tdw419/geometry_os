; DESCRIPTION: Draws a cyan rectangle at (79, 79) with width 112 and height 70.
; PLAN: r0=79(x), r1=79(y), r2=112(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 79
LDI r2, 112
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
