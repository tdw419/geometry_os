; DESCRIPTION: Places a orange 104x28 rectangle at position (15, 48).
; PLAN: r0=15(x), r1=48(y), r2=104(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 48
LDI r2, 104
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
