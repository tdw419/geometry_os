; DESCRIPTION: Renders a blue box of size 57x115 starting at (246, 0).
; PLAN: r0=246(x), r1=0(y), r2=57(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 0
LDI r2, 57
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
