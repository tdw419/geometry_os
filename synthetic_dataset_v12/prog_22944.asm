; DESCRIPTION: Places a white 61x115 rectangle at position (402, 130).
; PLAN: r0=402(x), r1=130(y), r2=61(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 130
LDI r2, 61
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
