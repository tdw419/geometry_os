; DESCRIPTION: Renders a purple box of size 120x85 starting at (16, 25).
; PLAN: r0=16(x), r1=25(y), r2=120(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 25
LDI r2, 120
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
