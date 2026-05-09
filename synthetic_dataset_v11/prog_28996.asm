; DESCRIPTION: Places a yellow 92x66 rectangle at position (110, 15).
; PLAN: r0=110(x), r1=15(y), r2=92(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 15
LDI r2, 92
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
