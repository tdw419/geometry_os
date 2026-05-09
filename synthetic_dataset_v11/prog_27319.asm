; DESCRIPTION: Places a cyan 96x40 rectangle at position (102, 128).
; PLAN: r0=102(x), r1=128(y), r2=96(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 128
LDI r2, 96
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
