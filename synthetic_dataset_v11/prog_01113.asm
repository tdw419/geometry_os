; DESCRIPTION: Places a cyan 101x48 rectangle at position (45, 82).
; PLAN: r0=45(x), r1=82(y), r2=101(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 82
LDI r2, 101
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
