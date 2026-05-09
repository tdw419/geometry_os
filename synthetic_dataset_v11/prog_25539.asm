; DESCRIPTION: Places a yellow 72x103 rectangle at position (45, 89).
; PLAN: r0=45(x), r1=89(y), r2=72(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 89
LDI r2, 72
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
