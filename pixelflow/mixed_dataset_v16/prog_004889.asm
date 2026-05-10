; DESCRIPTION: Places a cyan 45x13 rectangle at position (2, 182).
; PLAN: r0=2(x), r1=182(y), r2=45(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 182
LDI r2, 45
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
