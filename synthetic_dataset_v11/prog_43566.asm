; DESCRIPTION: Places a yellow 32x11 rectangle at position (184, 99).
; PLAN: r0=184(x), r1=99(y), r2=32(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 99
LDI r2, 32
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
