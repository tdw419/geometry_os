; DESCRIPTION: Places a white 18x42 rectangle at position (6, 192).
; PLAN: r0=6(x), r1=192(y), r2=18(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 192
LDI r2, 18
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
