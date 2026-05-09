; DESCRIPTION: Draws a purple rectangle at (365, 99) with width 27 and height 48.
; PLAN: r0=365(x), r1=99(y), r2=27(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 99
LDI r2, 27
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
