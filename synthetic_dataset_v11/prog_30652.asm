; DESCRIPTION: Places a yellow 104x20 rectangle at position (79, 218).
; PLAN: r0=79(x), r1=218(y), r2=104(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 218
LDI r2, 104
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
