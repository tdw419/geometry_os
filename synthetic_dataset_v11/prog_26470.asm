; DESCRIPTION: Places a orange 48x39 rectangle at position (104, 133).
; PLAN: r0=104(x), r1=133(y), r2=48(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 133
LDI r2, 48
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
