; DESCRIPTION: Places a white 42x18 rectangle at position (73, 71).
; PLAN: r0=73(x), r1=71(y), r2=42(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 71
LDI r2, 42
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
