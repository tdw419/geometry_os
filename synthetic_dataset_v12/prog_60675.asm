; DESCRIPTION: Places a yellow 65x14 rectangle at position (314, 150).
; PLAN: r0=314(x), r1=150(y), r2=65(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 150
LDI r2, 65
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
