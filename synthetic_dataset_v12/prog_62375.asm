; DESCRIPTION: Places a cyan 11x77 rectangle at position (167, 157).
; PLAN: r0=167(x), r1=157(y), r2=11(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 157
LDI r2, 11
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
