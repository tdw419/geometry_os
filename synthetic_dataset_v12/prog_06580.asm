; DESCRIPTION: Renders a purple box of size 58x44 starting at (246, 177).
; PLAN: r0=246(x), r1=177(y), r2=58(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 177
LDI r2, 58
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
