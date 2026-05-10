; DESCRIPTION: Places a red 79x100 rectangle at position (264, 154).
; PLAN: r0=264(x), r1=154(y), r2=79(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 154
LDI r2, 79
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
