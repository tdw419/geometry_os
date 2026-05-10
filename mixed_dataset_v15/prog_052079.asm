; DESCRIPTION: Renders a purple box of size 72x32 starting at (111, 222).
; PLAN: r0=111(x), r1=222(y), r2=72(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 222
LDI r2, 72
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
