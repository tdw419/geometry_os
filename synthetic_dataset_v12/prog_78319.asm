; DESCRIPTION: Places a yellow 32x95 rectangle at position (440, 118).
; PLAN: r0=440(x), r1=118(y), r2=32(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 118
LDI r2, 32
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
