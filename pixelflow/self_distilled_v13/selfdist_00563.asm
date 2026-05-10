; DESCRIPTION: Draws a cyan rectangle at (85, 174) with width 77 and height 113.
; PLAN: r0=85(x), r1=174(y), r2=77(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 174
LDI r2, 77
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
