; DESCRIPTION: Places a orange 104x39 rectangle at position (392, 121).
; PLAN: r0=392(x), r1=121(y), r2=104(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 121
LDI r2, 104
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
