; DESCRIPTION: Places a orange 58x22 rectangle at position (299, 177).
; PLAN: r0=299(x), r1=177(y), r2=58(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 177
LDI r2, 58
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
