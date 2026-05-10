; DESCRIPTION: Places a orange 104x120 rectangle at position (133, 95).
; PLAN: r0=133(x), r1=95(y), r2=104(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 95
LDI r2, 104
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
