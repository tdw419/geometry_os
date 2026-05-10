; DESCRIPTION: Places a blue 119x93 rectangle at position (139, 154).
; PLAN: r0=139(x), r1=154(y), r2=119(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 154
LDI r2, 119
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
