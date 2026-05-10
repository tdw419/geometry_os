; DESCRIPTION: Places a white 42x24 rectangle at position (224, 165).
; PLAN: r0=224(x), r1=165(y), r2=42(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 165
LDI r2, 42
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
