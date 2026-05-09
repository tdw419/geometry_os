; DESCRIPTION: Places a purple 98x59 rectangle at position (370, 151).
; PLAN: r0=370(x), r1=151(y), r2=98(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 151
LDI r2, 98
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
