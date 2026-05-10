; DESCRIPTION: Places a white 109x21 rectangle at position (74, 185).
; PLAN: r0=74(x), r1=185(y), r2=109(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 185
LDI r2, 109
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
