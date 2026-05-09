; DESCRIPTION: Places a orange 29x53 rectangle at position (453, 109).
; PLAN: r0=453(x), r1=109(y), r2=29(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 109
LDI r2, 29
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
