; DESCRIPTION: Places a white 66x112 rectangle at position (327, 14).
; PLAN: r0=327(x), r1=14(y), r2=66(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 14
LDI r2, 66
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
