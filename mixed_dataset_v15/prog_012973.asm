; DESCRIPTION: Places a white 93x92 rectangle at position (399, 16).
; PLAN: r0=399(x), r1=16(y), r2=93(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 16
LDI r2, 93
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
