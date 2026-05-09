; DESCRIPTION: Places a cyan 101x79 rectangle at position (356, 93).
; PLAN: r0=356(x), r1=93(y), r2=101(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 93
LDI r2, 101
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
