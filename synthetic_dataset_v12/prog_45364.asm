; DESCRIPTION: Places a white 42x39 rectangle at position (115, 188).
; PLAN: r0=115(x), r1=188(y), r2=42(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 188
LDI r2, 42
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
