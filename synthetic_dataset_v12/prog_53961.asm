; DESCRIPTION: Places a white 42x90 rectangle at position (102, 141).
; PLAN: r0=102(x), r1=141(y), r2=42(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 141
LDI r2, 42
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
