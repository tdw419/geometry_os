; DESCRIPTION: Places a orange 92x61 rectangle at position (130, 0).
; PLAN: r0=130(x), r1=0(y), r2=92(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 0
LDI r2, 92
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
