; DESCRIPTION: Renders a purple box of size 83x67 starting at (308, 124).
; PLAN: r0=308(x), r1=124(y), r2=83(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 124
LDI r2, 83
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
