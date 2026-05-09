; DESCRIPTION: Places a black 64x99 rectangle at position (38, 52).
; PLAN: r0=38(x), r1=52(y), r2=64(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 52
LDI r2, 64
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
