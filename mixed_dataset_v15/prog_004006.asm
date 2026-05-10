; DESCRIPTION: Places a orange 101x104 rectangle at position (294, 137).
; PLAN: r0=294(x), r1=137(y), r2=101(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 137
LDI r2, 101
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
