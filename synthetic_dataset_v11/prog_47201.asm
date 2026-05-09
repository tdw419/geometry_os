; DESCRIPTION: Places a magenta 106x31 rectangle at position (34, 154).
; PLAN: r0=34(x), r1=154(y), r2=106(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 154
LDI r2, 106
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
