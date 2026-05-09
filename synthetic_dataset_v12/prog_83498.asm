; DESCRIPTION: Renders a purple box of size 48x47 starting at (349, 135).
; PLAN: r0=349(x), r1=135(y), r2=48(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 135
LDI r2, 48
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
