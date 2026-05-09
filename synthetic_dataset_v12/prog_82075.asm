; DESCRIPTION: Renders a purple box of size 104x24 starting at (383, 60).
; PLAN: r0=383(x), r1=60(y), r2=104(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 60
LDI r2, 104
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
