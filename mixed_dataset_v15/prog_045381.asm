; DESCRIPTION: Renders a blue box of size 92x102 starting at (256, 60).
; PLAN: r0=256(x), r1=60(y), r2=92(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 60
LDI r2, 92
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
