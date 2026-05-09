; DESCRIPTION: Places a yellow 15x15 rectangle at position (100, 16).
; PLAN: r0=100(x), r1=16(y), r2=15(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 16
LDI r2, 15
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
