; DESCRIPTION: Places a yellow 104x64 rectangle at position (14, 155).
; PLAN: r0=14(x), r1=155(y), r2=104(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 155
LDI r2, 104
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
