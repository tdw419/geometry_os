; DESCRIPTION: Places a white 92x32 rectangle at position (218, 79).
; PLAN: r0=218(x), r1=79(y), r2=92(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 79
LDI r2, 92
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
