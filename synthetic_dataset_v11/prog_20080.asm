; DESCRIPTION: Places a orange 28x104 rectangle at position (25, 64).
; PLAN: r0=25(x), r1=64(y), r2=28(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 64
LDI r2, 28
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
