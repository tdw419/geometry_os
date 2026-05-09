; DESCRIPTION: Places a orange 92x84 rectangle at position (36, 13).
; PLAN: r0=36(x), r1=13(y), r2=92(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 13
LDI r2, 92
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
