; DESCRIPTION: Places a white 85x92 rectangle at position (48, 71).
; PLAN: r0=48(x), r1=71(y), r2=85(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 71
LDI r2, 85
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
