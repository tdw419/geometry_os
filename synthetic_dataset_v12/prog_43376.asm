; DESCRIPTION: Places a orange 100x111 rectangle at position (356, 46).
; PLAN: r0=356(x), r1=46(y), r2=100(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 46
LDI r2, 100
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
