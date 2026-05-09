; DESCRIPTION: Places a green 106x94 rectangle at position (95, 40).
; PLAN: r0=95(x), r1=40(y), r2=106(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 40
LDI r2, 106
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
