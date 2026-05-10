; DESCRIPTION: Places a white 48x92 rectangle at position (40, 23).
; PLAN: r0=40(x), r1=23(y), r2=48(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 23
LDI r2, 48
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
