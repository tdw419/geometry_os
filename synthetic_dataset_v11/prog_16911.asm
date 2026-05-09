; DESCRIPTION: Renders a purple box of size 16x98 starting at (193, 16).
; PLAN: r0=193(x), r1=16(y), r2=16(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 16
LDI r2, 16
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
