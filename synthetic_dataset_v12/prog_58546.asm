; DESCRIPTION: Renders a purple box of size 86x67 starting at (367, 44).
; PLAN: r0=367(x), r1=44(y), r2=86(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 44
LDI r2, 86
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
