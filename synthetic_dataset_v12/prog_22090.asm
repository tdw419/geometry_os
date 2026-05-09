; DESCRIPTION: Places a red 16x77 rectangle at position (212, 130).
; PLAN: r0=212(x), r1=130(y), r2=16(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 130
LDI r2, 16
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
