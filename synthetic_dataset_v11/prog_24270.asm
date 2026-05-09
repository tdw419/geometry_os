; DESCRIPTION: Renders a purple box of size 75x59 starting at (164, 131).
; PLAN: r0=164(x), r1=131(y), r2=75(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 131
LDI r2, 75
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
