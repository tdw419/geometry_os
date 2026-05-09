; DESCRIPTION: Draws a orange rectangle at (157, 195) with width 27 and height 34.
; PLAN: r0=157(x), r1=195(y), r2=27(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 195
LDI r2, 27
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
