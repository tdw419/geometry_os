; DESCRIPTION: Places a cyan 66x28 rectangle at position (5, 77).
; PLAN: r0=5(x), r1=77(y), r2=66(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 77
LDI r2, 66
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
