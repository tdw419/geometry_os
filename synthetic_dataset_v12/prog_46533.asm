; DESCRIPTION: Places a yellow 65x96 rectangle at position (10, 18).
; PLAN: r0=10(x), r1=18(y), r2=65(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 18
LDI r2, 65
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
