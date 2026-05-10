; DESCRIPTION: Places a white 119x42 rectangle at position (115, 65).
; PLAN: r0=115(x), r1=65(y), r2=119(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 65
LDI r2, 119
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
