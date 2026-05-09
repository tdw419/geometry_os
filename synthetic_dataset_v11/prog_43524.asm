; DESCRIPTION: Places a cyan 33x80 rectangle at position (68, 10).
; PLAN: r0=68(x), r1=10(y), r2=33(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 10
LDI r2, 33
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
