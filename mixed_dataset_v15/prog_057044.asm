; DESCRIPTION: Renders a purple box of size 57x29 starting at (346, 135).
; PLAN: r0=346(x), r1=135(y), r2=57(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 135
LDI r2, 57
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
