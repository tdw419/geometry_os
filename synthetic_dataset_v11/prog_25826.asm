; DESCRIPTION: Places a yellow 10x120 rectangle at position (3, 133).
; PLAN: r0=3(x), r1=133(y), r2=10(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 133
LDI r2, 10
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
