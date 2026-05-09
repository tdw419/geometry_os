; DESCRIPTION: Places a orange 24x92 rectangle at position (13, 83).
; PLAN: r0=13(x), r1=83(y), r2=24(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 83
LDI r2, 24
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
