; DESCRIPTION: Places a yellow 56x100 rectangle at position (372, 151).
; PLAN: r0=372(x), r1=151(y), r2=56(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 151
LDI r2, 56
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
