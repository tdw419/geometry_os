; DESCRIPTION: Renders a blue box of size 106x50 starting at (98, 56).
; PLAN: r0=98(x), r1=56(y), r2=106(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 56
LDI r2, 106
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
