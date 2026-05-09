; DESCRIPTION: Places a white 42x52 rectangle at position (3, 163).
; PLAN: r0=3(x), r1=163(y), r2=42(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 163
LDI r2, 42
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
