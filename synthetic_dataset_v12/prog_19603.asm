; DESCRIPTION: Renders a blue box of size 82x11 starting at (56, 177).
; PLAN: r0=56(x), r1=177(y), r2=82(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 177
LDI r2, 82
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
