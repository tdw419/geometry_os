; DESCRIPTION: Places a orange 93x24 rectangle at position (6, 154).
; PLAN: r0=6(x), r1=154(y), r2=93(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 154
LDI r2, 93
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
