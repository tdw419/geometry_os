; DESCRIPTION: Renders a purple box of size 103x103 starting at (383, 141).
; PLAN: r0=383(x), r1=141(y), r2=103(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 141
LDI r2, 103
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
