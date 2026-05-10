; DESCRIPTION: Creates a white filled rectangle of size 59x54 starting at (206, 81).
; PLAN: r0=206(x), r1=81(y), r2=59(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 81
LDI r2, 59
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
