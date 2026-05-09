; DESCRIPTION: Places a magenta 72x80 rectangle at position (16, 154).
; PLAN: r0=16(x), r1=154(y), r2=72(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 154
LDI r2, 72
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
