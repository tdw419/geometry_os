; DESCRIPTION: Places a green 102x112 rectangle at position (94, 42).
; PLAN: r0=94(x), r1=42(y), r2=102(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 42
LDI r2, 102
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
