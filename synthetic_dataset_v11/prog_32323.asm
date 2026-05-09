; DESCRIPTION: Places a cyan 50x95 rectangle at position (131, 128).
; PLAN: r0=131(x), r1=128(y), r2=50(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 128
LDI r2, 50
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
