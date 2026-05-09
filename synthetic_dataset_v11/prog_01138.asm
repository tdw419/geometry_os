; DESCRIPTION: Places a yellow 16x73 rectangle at position (56, 0).
; PLAN: r0=56(x), r1=0(y), r2=16(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 0
LDI r2, 16
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
