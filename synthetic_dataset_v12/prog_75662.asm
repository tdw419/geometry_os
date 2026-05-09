; DESCRIPTION: Places a white 92x99 rectangle at position (104, 24).
; PLAN: r0=104(x), r1=24(y), r2=92(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 24
LDI r2, 92
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
