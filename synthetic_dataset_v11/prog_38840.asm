; DESCRIPTION: Places a cyan 109x54 rectangle at position (63, 99).
; PLAN: r0=63(x), r1=99(y), r2=109(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 99
LDI r2, 109
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
