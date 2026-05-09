; DESCRIPTION: Places a cyan 109x10 rectangle at position (110, 202).
; PLAN: r0=110(x), r1=202(y), r2=109(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 202
LDI r2, 109
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
