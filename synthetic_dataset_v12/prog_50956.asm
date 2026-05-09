; DESCRIPTION: Renders a purple box of size 66x13 starting at (255, 94).
; PLAN: r0=255(x), r1=94(y), r2=66(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 94
LDI r2, 66
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
