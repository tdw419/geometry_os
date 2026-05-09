; DESCRIPTION: Places a orange 55x104 rectangle at position (7, 15).
; PLAN: r0=7(x), r1=15(y), r2=55(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 15
LDI r2, 55
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
