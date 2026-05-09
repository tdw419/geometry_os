; DESCRIPTION: Places a red 92x91 rectangle at position (117, 151).
; PLAN: r0=117(x), r1=151(y), r2=92(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 151
LDI r2, 92
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
