; DESCRIPTION: Places a orange 68x111 rectangle at position (148, 98).
; PLAN: r0=148(x), r1=98(y), r2=68(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 98
LDI r2, 68
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
