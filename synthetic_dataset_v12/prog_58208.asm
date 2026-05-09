; DESCRIPTION: Places a white 36x57 rectangle at position (377, 42).
; PLAN: r0=377(x), r1=42(y), r2=36(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 42
LDI r2, 36
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
