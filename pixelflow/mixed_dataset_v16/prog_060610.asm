; DESCRIPTION: Places a green 74x68 rectangle at position (193, 154).
; PLAN: r0=193(x), r1=154(y), r2=74(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 154
LDI r2, 74
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
