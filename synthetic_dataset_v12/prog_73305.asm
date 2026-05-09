; DESCRIPTION: Places a orange 73x95 rectangle at position (321, 15).
; PLAN: r0=321(x), r1=15(y), r2=73(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 15
LDI r2, 73
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
