; DESCRIPTION: Places a yellow 105x64 rectangle at position (138, 14).
; PLAN: r0=138(x), r1=14(y), r2=105(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 14
LDI r2, 105
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
