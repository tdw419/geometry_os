; DESCRIPTION: Places a orange 22x23 rectangle at position (63, 154).
; PLAN: r0=63(x), r1=154(y), r2=22(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 154
LDI r2, 22
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
