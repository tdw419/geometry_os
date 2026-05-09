; DESCRIPTION: Places a orange 45x100 rectangle at position (400, 53).
; PLAN: r0=400(x), r1=53(y), r2=45(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 53
LDI r2, 45
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
