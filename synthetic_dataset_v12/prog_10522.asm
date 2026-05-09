; DESCRIPTION: Places a blue 117x109 rectangle at position (200, 42).
; PLAN: r0=200(x), r1=42(y), r2=117(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 42
LDI r2, 117
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
