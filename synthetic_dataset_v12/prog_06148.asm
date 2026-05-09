; DESCRIPTION: Places a white 14x52 rectangle at position (50, 33).
; PLAN: r0=50(x), r1=33(y), r2=14(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 33
LDI r2, 14
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
