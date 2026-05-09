; DESCRIPTION: Places a white 15x20 rectangle at position (71, 168).
; PLAN: r0=71(x), r1=168(y), r2=15(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 168
LDI r2, 15
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
