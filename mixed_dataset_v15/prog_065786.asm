; DESCRIPTION: Places a white 52x54 rectangle at position (274, 95).
; PLAN: r0=274(x), r1=95(y), r2=52(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 95
LDI r2, 52
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
