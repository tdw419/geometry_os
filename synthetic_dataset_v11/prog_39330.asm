; DESCRIPTION: Places a cyan 35x77 rectangle at position (182, 56).
; PLAN: r0=182(x), r1=56(y), r2=35(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 56
LDI r2, 35
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
