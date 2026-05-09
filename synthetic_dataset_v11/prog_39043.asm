; DESCRIPTION: Places a cyan 96x80 rectangle at position (68, 61).
; PLAN: r0=68(x), r1=61(y), r2=96(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 61
LDI r2, 96
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
