; DESCRIPTION: Places a cyan 12x112 rectangle at position (334, 52).
; PLAN: r0=334(x), r1=52(y), r2=12(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 52
LDI r2, 12
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
