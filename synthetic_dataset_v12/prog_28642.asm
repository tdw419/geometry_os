; DESCRIPTION: Renders a purple box of size 34x54 starting at (418, 177).
; PLAN: r0=418(x), r1=177(y), r2=34(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 177
LDI r2, 34
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
