; DESCRIPTION: Places a orange 32x55 rectangle at position (169, 165).
; PLAN: r0=169(x), r1=165(y), r2=32(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 165
LDI r2, 32
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
