; DESCRIPTION: Renders a blue box of size 31x113 starting at (33, 82).
; PLAN: r0=33(x), r1=82(y), r2=31(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 82
LDI r2, 31
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
