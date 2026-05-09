; DESCRIPTION: Renders a purple box of size 75x39 starting at (7, 57).
; PLAN: r0=7(x), r1=57(y), r2=75(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 57
LDI r2, 75
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
