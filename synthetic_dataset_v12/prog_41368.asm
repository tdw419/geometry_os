; DESCRIPTION: Places a cyan 103x118 rectangle at position (115, 54).
; PLAN: r0=115(x), r1=54(y), r2=103(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 54
LDI r2, 103
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
