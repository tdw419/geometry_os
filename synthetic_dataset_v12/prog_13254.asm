; DESCRIPTION: Places a yellow 59x28 rectangle at position (36, 151).
; PLAN: r0=36(x), r1=151(y), r2=59(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 151
LDI r2, 59
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
