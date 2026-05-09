; DESCRIPTION: Places a white 36x42 rectangle at position (35, 186).
; PLAN: r0=35(x), r1=186(y), r2=36(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 186
LDI r2, 36
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
