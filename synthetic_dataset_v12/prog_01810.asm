; DESCRIPTION: Places a orange 44x85 rectangle at position (92, 116).
; PLAN: r0=92(x), r1=116(y), r2=44(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 116
LDI r2, 44
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
