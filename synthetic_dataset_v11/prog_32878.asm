; DESCRIPTION: Places a white 92x90 rectangle at position (56, 22).
; PLAN: r0=56(x), r1=22(y), r2=92(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 22
LDI r2, 92
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
