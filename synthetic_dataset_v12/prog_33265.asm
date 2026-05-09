; DESCRIPTION: Places a black 90x87 rectangle at position (235, 151).
; PLAN: r0=235(x), r1=151(y), r2=90(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 151
LDI r2, 90
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
