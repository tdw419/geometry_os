; DESCRIPTION: Renders a purple box of size 103x73 starting at (79, 74).
; PLAN: r0=79(x), r1=74(y), r2=103(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 74
LDI r2, 103
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
