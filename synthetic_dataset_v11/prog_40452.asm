; DESCRIPTION: Places a yellow 110x99 rectangle at position (64, 18).
; PLAN: r0=64(x), r1=18(y), r2=110(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 18
LDI r2, 110
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
