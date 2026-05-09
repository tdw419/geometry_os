; DESCRIPTION: Places a red 64x77 rectangle at position (130, 162).
; PLAN: r0=130(x), r1=162(y), r2=64(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 162
LDI r2, 64
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
