; DESCRIPTION: Renders a purple box of size 24x31 starting at (246, 195).
; PLAN: r0=246(x), r1=195(y), r2=24(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 195
LDI r2, 24
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
