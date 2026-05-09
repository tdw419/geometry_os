; DESCRIPTION: Places a white 101x86 rectangle at position (311, 14).
; PLAN: r0=311(x), r1=14(y), r2=101(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 14
LDI r2, 101
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
