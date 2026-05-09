; DESCRIPTION: Places a white 74x59 rectangle at position (318, 120).
; PLAN: r0=318(x), r1=120(y), r2=74(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 120
LDI r2, 74
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
