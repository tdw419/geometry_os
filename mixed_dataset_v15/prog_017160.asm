; DESCRIPTION: Places a yellow 119x31 rectangle at position (120, 154).
; PLAN: r0=120(x), r1=154(y), r2=119(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 154
LDI r2, 119
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
