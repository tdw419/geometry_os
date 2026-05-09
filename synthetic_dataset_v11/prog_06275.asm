; DESCRIPTION: Places a white 93x95 rectangle at position (151, 76).
; PLAN: r0=151(x), r1=76(y), r2=93(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 76
LDI r2, 93
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
