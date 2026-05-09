; DESCRIPTION: Draws a purple rectangle at (301, 39) with width 27 and height 99.
; PLAN: r0=301(x), r1=39(y), r2=27(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 39
LDI r2, 27
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
