; DESCRIPTION: Places a green 92x100 rectangle at position (270, 154).
; PLAN: r0=270(x), r1=154(y), r2=92(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 154
LDI r2, 92
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
