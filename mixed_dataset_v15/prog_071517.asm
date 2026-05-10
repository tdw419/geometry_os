; DESCRIPTION: Places a magenta 55x41 rectangle at position (304, 152).
; PLAN: r0=304(x), r1=152(y), r2=55(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 152
LDI r2, 55
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
