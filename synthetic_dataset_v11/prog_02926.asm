; DESCRIPTION: Renders a purple box of size 69x90 starting at (72, 38).
; PLAN: r0=72(x), r1=38(y), r2=69(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 38
LDI r2, 69
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
