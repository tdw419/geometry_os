; DESCRIPTION: Draws a cyan rectangle at (133, 171) with width 47 and height 13.
; PLAN: r0=133(x), r1=171(y), r2=47(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 171
LDI r2, 47
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
