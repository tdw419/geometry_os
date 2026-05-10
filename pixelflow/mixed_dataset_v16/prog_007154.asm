; DESCRIPTION: Renders a purple box of size 16x113 starting at (258, 54).
; PLAN: r0=258(x), r1=54(y), r2=16(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 54
LDI r2, 16
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
