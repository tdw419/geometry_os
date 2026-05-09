; DESCRIPTION: Renders a purple box of size 95x98 starting at (182, 60).
; PLAN: r0=182(x), r1=60(y), r2=95(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 60
LDI r2, 95
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
