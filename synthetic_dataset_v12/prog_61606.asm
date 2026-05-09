; DESCRIPTION: Renders a purple box of size 86x98 starting at (303, 29).
; PLAN: r0=303(x), r1=29(y), r2=86(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 29
LDI r2, 86
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
