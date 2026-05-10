; DESCRIPTION: Renders a purple box of size 22x39 starting at (439, 177).
; PLAN: r0=439(x), r1=177(y), r2=22(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 177
LDI r2, 22
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
