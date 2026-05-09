; DESCRIPTION: Places a orange 104x40 rectangle at position (98, 42).
; PLAN: r0=98(x), r1=42(y), r2=104(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 42
LDI r2, 104
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
