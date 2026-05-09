; DESCRIPTION: Renders a blue box of size 16x58 starting at (59, 124).
; PLAN: r0=59(x), r1=124(y), r2=16(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 124
LDI r2, 16
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
