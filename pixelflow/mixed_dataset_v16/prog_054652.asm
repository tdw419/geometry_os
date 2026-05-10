; DESCRIPTION: Places a green 109x55 rectangle at position (23, 128).
; PLAN: r0=23(x), r1=128(y), r2=109(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 128
LDI r2, 109
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
