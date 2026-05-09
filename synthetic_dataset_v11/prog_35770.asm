; DESCRIPTION: Places a green 119x34 rectangle at position (46, 151).
; PLAN: r0=46(x), r1=151(y), r2=119(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 151
LDI r2, 119
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
