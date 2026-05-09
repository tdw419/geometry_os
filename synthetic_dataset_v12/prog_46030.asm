; DESCRIPTION: Places a cyan 58x71 rectangle at position (356, 79).
; PLAN: r0=356(x), r1=79(y), r2=58(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 79
LDI r2, 58
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
