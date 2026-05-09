; DESCRIPTION: Places a orange 61x55 rectangle at position (16, 73).
; PLAN: r0=16(x), r1=73(y), r2=61(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 73
LDI r2, 61
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
