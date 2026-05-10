; DESCRIPTION: Places a orange 50x28 rectangle at position (396, 200).
; PLAN: r0=396(x), r1=200(y), r2=50(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 200
LDI r2, 50
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
