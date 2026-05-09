; DESCRIPTION: Places a cyan 109x10 rectangle at position (75, 135).
; PLAN: r0=75(x), r1=135(y), r2=109(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 135
LDI r2, 109
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
