; DESCRIPTION: Draws a cyan rectangle at (79, 125) with width 102 and height 113.
; PLAN: r0=79(x), r1=125(y), r2=102(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 125
LDI r2, 102
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
