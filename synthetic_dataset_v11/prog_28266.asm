; DESCRIPTION: Places a blue 101x76 rectangle at position (66, 154).
; PLAN: r0=66(x), r1=154(y), r2=101(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 154
LDI r2, 101
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
