; DESCRIPTION: Places a magenta 53x34 rectangle at position (445, 126).
; PLAN: r0=445(x), r1=126(y), r2=53(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 126
LDI r2, 53
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
