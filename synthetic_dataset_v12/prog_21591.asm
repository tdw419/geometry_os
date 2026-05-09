; DESCRIPTION: Places a yellow 100x50 rectangle at position (181, 65).
; PLAN: r0=181(x), r1=65(y), r2=100(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 65
LDI r2, 100
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
