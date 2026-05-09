; DESCRIPTION: Places a magenta 89x61 rectangle at position (189, 154).
; PLAN: r0=189(x), r1=154(y), r2=89(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 154
LDI r2, 89
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
