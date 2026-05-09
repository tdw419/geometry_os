; DESCRIPTION: Renders a purple box of size 103x48 starting at (12, 121).
; PLAN: r0=12(x), r1=121(y), r2=103(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 121
LDI r2, 103
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
