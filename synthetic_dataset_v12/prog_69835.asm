; DESCRIPTION: Places a white 68x23 rectangle at position (195, 83).
; PLAN: r0=195(x), r1=83(y), r2=68(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 83
LDI r2, 68
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
