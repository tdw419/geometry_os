; DESCRIPTION: Places a magenta 53x90 rectangle at position (438, 53).
; PLAN: r0=438(x), r1=53(y), r2=53(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 53
LDI r2, 53
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
