; DESCRIPTION: Places a orange 29x90 rectangle at position (142, 142).
; PLAN: r0=142(x), r1=142(y), r2=29(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 142
LDI r2, 29
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
