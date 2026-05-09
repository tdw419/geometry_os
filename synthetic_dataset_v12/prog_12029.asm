; DESCRIPTION: Renders a blue box of size 113x24 starting at (103, 177).
; PLAN: r0=103(x), r1=177(y), r2=113(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 177
LDI r2, 113
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
