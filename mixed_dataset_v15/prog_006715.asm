; DESCRIPTION: Places a white 72x87 rectangle at position (28, 92).
; PLAN: r0=28(x), r1=92(y), r2=72(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 92
LDI r2, 72
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
