; DESCRIPTION: Renders a purple box of size 86x99 starting at (265, 93).
; PLAN: r0=265(x), r1=93(y), r2=86(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 93
LDI r2, 86
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
