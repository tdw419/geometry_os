; DESCRIPTION: Renders a purple box of size 16x61 starting at (26, 10).
; PLAN: r0=26(x), r1=10(y), r2=16(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 10
LDI r2, 16
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
