; DESCRIPTION: Places a cyan 95x104 box at position (10, 154).
; PLAN: r0=10(x), r1=154(y), r2=95(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 154
LDI r2, 95
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
