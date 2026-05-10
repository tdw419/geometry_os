; DESCRIPTION: Renders a purple box of size 36x30 starting at (412, 168).
; PLAN: r0=412(x), r1=168(y), r2=36(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 168
LDI r2, 36
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
