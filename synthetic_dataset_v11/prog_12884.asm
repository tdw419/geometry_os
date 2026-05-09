; DESCRIPTION: Renders a purple box of size 82x17 starting at (38, 98).
; PLAN: r0=38(x), r1=98(y), r2=82(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 98
LDI r2, 82
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
