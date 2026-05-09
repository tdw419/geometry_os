; DESCRIPTION: Renders a purple box of size 39x74 starting at (57, 176).
; PLAN: r0=57(x), r1=176(y), r2=39(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 176
LDI r2, 39
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
