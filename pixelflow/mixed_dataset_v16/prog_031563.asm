; DESCRIPTION: Renders a purple box of size 37x55 starting at (305, 67).
; PLAN: r0=305(x), r1=67(y), r2=37(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 67
LDI r2, 37
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
