; DESCRIPTION: Renders a purple box of size 24x27 starting at (47, 120).
; PLAN: r0=47(x), r1=120(y), r2=24(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 120
LDI r2, 24
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
