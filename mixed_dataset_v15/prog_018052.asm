; DESCRIPTION: Renders a purple box of size 57x45 starting at (341, 173).
; PLAN: r0=341(x), r1=173(y), r2=57(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 173
LDI r2, 57
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
