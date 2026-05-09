; DESCRIPTION: Renders a purple box of size 44x102 starting at (153, 113).
; PLAN: r0=153(x), r1=113(y), r2=44(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 113
LDI r2, 44
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
