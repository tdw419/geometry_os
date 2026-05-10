; DESCRIPTION: Places a black 37x102 rectangle at position (248, 154).
; PLAN: r0=248(x), r1=154(y), r2=37(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 154
LDI r2, 37
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
