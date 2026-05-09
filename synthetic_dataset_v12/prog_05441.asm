; DESCRIPTION: Places a white 120x92 rectangle at position (89, 47).
; PLAN: r0=89(x), r1=47(y), r2=120(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 47
LDI r2, 120
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
