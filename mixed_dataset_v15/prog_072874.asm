; DESCRIPTION: Places a orange 23x30 rectangle at position (172, 215).
; PLAN: r0=172(x), r1=215(y), r2=23(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 215
LDI r2, 23
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
