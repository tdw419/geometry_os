; DESCRIPTION: Places a red 21x100 rectangle at position (52, 144).
; PLAN: r0=52(x), r1=144(y), r2=21(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 144
LDI r2, 21
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
