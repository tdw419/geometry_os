; DESCRIPTION: Draws a cyan rectangle at (301, 181) with width 85 and height 72.
; PLAN: r0=301(x), r1=181(y), r2=85(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 181
LDI r2, 85
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
