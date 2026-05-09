; DESCRIPTION: Places a orange 101x47 rectangle at position (130, 169).
; PLAN: r0=130(x), r1=169(y), r2=101(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 169
LDI r2, 101
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
