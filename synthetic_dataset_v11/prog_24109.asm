; DESCRIPTION: Places a purple 58x27 rectangle at position (152, 76).
; PLAN: r0=152(x), r1=76(y), r2=58(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 76
LDI r2, 58
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
