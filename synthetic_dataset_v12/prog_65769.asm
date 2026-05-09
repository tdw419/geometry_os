; DESCRIPTION: Creates a white rectangular region at (115, 45) spanning 42 by 67 pixels.
; PLAN: r0=115(x), r1=45(y), r2=42(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 45
LDI r2, 42
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
