; DESCRIPTION: Places a green 109x31 rectangle at position (41, 154).
; PLAN: r0=41(x), r1=154(y), r2=109(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 154
LDI r2, 109
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
