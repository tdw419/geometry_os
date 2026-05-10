; DESCRIPTION: Places a red 68x55 rectangle at position (431, 73).
; PLAN: r0=431(x), r1=73(y), r2=68(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 73
LDI r2, 68
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
