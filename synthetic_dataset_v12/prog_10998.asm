; DESCRIPTION: Places a red 15x28 rectangle at position (0, 89).
; PLAN: r0=0(x), r1=89(y), r2=15(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 89
LDI r2, 15
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
