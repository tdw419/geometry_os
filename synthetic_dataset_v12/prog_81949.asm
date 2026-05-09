; DESCRIPTION: Places a orange 104x48 rectangle at position (169, 12).
; PLAN: r0=169(x), r1=12(y), r2=104(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 12
LDI r2, 104
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
