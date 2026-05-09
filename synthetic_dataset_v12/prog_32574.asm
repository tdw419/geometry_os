; DESCRIPTION: Places a green 109x98 rectangle at position (54, 152).
; PLAN: r0=54(x), r1=152(y), r2=109(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 152
LDI r2, 109
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
