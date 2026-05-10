; DESCRIPTION: Places a green 26x42 rectangle at position (49, 154).
; PLAN: r0=49(x), r1=154(y), r2=26(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 154
LDI r2, 26
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
