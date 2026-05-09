; DESCRIPTION: Places a green 120x95 rectangle at position (22, 89).
; PLAN: r0=22(x), r1=89(y), r2=120(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 89
LDI r2, 120
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
