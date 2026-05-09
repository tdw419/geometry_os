; DESCRIPTION: Renders a yellow box of size 65x108 starting at (305, 14).
; PLAN: r0=305(x), r1=14(y), r2=65(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 14
LDI r2, 65
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
