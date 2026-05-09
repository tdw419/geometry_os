; DESCRIPTION: Places a cyan 82x54 rectangle at position (100, 56).
; PLAN: r0=100(x), r1=56(y), r2=82(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 56
LDI r2, 82
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
