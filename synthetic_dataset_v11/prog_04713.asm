; DESCRIPTION: Places a cyan 10x13 rectangle at position (129, 65).
; PLAN: r0=129(x), r1=65(y), r2=10(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 65
LDI r2, 10
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
