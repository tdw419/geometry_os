; DESCRIPTION: Places a white 42x96 rectangle at position (46, 137).
; PLAN: r0=46(x), r1=137(y), r2=42(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 137
LDI r2, 42
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
