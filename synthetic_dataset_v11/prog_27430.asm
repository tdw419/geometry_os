; DESCRIPTION: Places a yellow 10x77 rectangle at position (212, 128).
; PLAN: r0=212(x), r1=128(y), r2=10(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 128
LDI r2, 10
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
