; DESCRIPTION: Places a cyan 76x10 rectangle at position (300, 75).
; PLAN: r0=300(x), r1=75(y), r2=76(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 75
LDI r2, 76
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
