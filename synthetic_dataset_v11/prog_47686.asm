; DESCRIPTION: Renders a purple box of size 38x56 starting at (70, 28).
; PLAN: r0=70(x), r1=28(y), r2=38(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 28
LDI r2, 38
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
