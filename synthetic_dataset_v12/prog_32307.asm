; DESCRIPTION: Places a green 23x109 rectangle at position (0, 69).
; PLAN: r0=0(x), r1=69(y), r2=23(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 69
LDI r2, 23
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
