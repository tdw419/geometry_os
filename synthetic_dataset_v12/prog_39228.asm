; DESCRIPTION: Places a red 52x100 rectangle at position (275, 60).
; PLAN: r0=275(x), r1=60(y), r2=52(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 60
LDI r2, 52
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
