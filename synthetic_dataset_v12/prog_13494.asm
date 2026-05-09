; DESCRIPTION: Places a white 109x50 rectangle at position (166, 77).
; PLAN: r0=166(x), r1=77(y), r2=109(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 77
LDI r2, 109
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
