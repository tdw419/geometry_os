; DESCRIPTION: Places a blue 68x41 rectangle at position (169, 152).
; PLAN: r0=169(x), r1=152(y), r2=68(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 152
LDI r2, 68
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
