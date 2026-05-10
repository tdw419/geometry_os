; DESCRIPTION: Renders a purple box of size 86x120 starting at (250, 120).
; PLAN: r0=250(x), r1=120(y), r2=86(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 120
LDI r2, 86
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
