; DESCRIPTION: Places a orange 55x92 rectangle at position (18, 119).
; PLAN: r0=18(x), r1=119(y), r2=55(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 119
LDI r2, 55
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
