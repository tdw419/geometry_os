; DESCRIPTION: Renders a purple box of size 29x98 starting at (91, 134).
; PLAN: r0=91(x), r1=134(y), r2=29(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 134
LDI r2, 29
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
