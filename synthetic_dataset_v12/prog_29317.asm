; DESCRIPTION: Places a green 54x63 rectangle at position (27, 154).
; PLAN: r0=27(x), r1=154(y), r2=54(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 154
LDI r2, 54
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
