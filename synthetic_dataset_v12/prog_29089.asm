; DESCRIPTION: Places a cyan 73x60 rectangle at position (123, 128).
; PLAN: r0=123(x), r1=128(y), r2=73(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 128
LDI r2, 73
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
