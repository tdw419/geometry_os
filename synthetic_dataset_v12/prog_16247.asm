; DESCRIPTION: Places a orange 95x18 rectangle at position (245, 155).
; PLAN: r0=245(x), r1=155(y), r2=95(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 155
LDI r2, 95
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
