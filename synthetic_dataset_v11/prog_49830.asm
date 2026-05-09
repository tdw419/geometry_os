; DESCRIPTION: Places a purple 90x23 rectangle at position (139, 154).
; PLAN: r0=139(x), r1=154(y), r2=90(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 154
LDI r2, 90
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
