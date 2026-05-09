; DESCRIPTION: Places a cyan 58x102 rectangle at position (193, 10).
; PLAN: r0=193(x), r1=10(y), r2=58(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 10
LDI r2, 58
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
