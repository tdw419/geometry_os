; DESCRIPTION: Places a green 103x11 rectangle at position (56, 154).
; PLAN: r0=56(x), r1=154(y), r2=103(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 154
LDI r2, 103
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
