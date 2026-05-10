; DESCRIPTION: Places a purple 21x53 rectangle at position (302, 154).
; PLAN: r0=302(x), r1=154(y), r2=21(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 154
LDI r2, 21
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
