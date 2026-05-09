; DESCRIPTION: Renders a yellow box of size 65x12 starting at (82, 14).
; PLAN: r0=82(x), r1=14(y), r2=65(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 14
LDI r2, 65
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
