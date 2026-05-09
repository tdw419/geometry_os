; DESCRIPTION: Renders a purple box of size 96x102 starting at (120, 117).
; PLAN: r0=120(x), r1=117(y), r2=96(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 117
LDI r2, 96
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
