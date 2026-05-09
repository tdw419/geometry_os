; DESCRIPTION: Places a white 42x70 rectangle at position (95, 68).
; PLAN: r0=95(x), r1=68(y), r2=42(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 68
LDI r2, 42
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
