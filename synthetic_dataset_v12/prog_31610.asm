; DESCRIPTION: Places a green 67x94 rectangle at position (184, 154).
; PLAN: r0=184(x), r1=154(y), r2=67(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 154
LDI r2, 67
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
