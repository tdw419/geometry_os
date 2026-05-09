; DESCRIPTION: Places a white 54x26 rectangle at position (42, 141).
; PLAN: r0=42(x), r1=141(y), r2=54(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 141
LDI r2, 54
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
