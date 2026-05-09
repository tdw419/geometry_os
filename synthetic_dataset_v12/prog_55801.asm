; DESCRIPTION: Renders a purple box of size 80x116 starting at (182, 134).
; PLAN: r0=182(x), r1=134(y), r2=80(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 134
LDI r2, 80
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
