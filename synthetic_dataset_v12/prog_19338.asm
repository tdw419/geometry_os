; DESCRIPTION: Places a blue 104x36 rectangle at position (214, 146).
; PLAN: r0=214(x), r1=146(y), r2=104(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 146
LDI r2, 104
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
