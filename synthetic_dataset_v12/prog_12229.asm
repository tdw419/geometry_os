; DESCRIPTION: Renders a blue box of size 14x32 starting at (82, 149).
; PLAN: r0=82(x), r1=149(y), r2=14(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 149
LDI r2, 14
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
