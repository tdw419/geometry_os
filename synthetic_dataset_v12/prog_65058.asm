; DESCRIPTION: Renders a purple box of size 15x47 starting at (62, 171).
; PLAN: r0=62(x), r1=171(y), r2=15(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 171
LDI r2, 15
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
