; DESCRIPTION: Places a red 85x28 rectangle at position (92, 152).
; PLAN: r0=92(x), r1=152(y), r2=85(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 152
LDI r2, 85
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
