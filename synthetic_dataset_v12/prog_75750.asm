; DESCRIPTION: Places a orange 46x46 rectangle at position (274, 92).
; PLAN: r0=274(x), r1=92(y), r2=46(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 92
LDI r2, 46
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
