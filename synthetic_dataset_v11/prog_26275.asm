; DESCRIPTION: Places a white 23x71 rectangle at position (221, 42).
; PLAN: r0=221(x), r1=42(y), r2=23(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 42
LDI r2, 23
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
