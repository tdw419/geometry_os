; DESCRIPTION: Places a white 109x42 rectangle at position (335, 54).
; PLAN: r0=335(x), r1=54(y), r2=109(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 54
LDI r2, 109
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
