; DESCRIPTION: Places a purple 49x77 rectangle at position (456, 154).
; PLAN: r0=456(x), r1=154(y), r2=49(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 154
LDI r2, 49
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
