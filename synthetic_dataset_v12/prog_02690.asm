; DESCRIPTION: Places a white 73x22 rectangle at position (86, 229).
; PLAN: r0=86(x), r1=229(y), r2=73(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 229
LDI r2, 73
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
