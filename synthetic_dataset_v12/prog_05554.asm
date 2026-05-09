; DESCRIPTION: Renders a purple box of size 61x112 starting at (154, 134).
; PLAN: r0=154(x), r1=134(y), r2=61(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 134
LDI r2, 61
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
