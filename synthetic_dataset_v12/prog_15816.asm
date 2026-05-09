; DESCRIPTION: Places a white 109x100 rectangle at position (45, 152).
; PLAN: r0=45(x), r1=152(y), r2=109(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 152
LDI r2, 109
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
