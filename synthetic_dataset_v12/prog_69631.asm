; DESCRIPTION: Places a cyan 70x75 rectangle at position (163, 154).
; PLAN: r0=163(x), r1=154(y), r2=70(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 154
LDI r2, 70
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
