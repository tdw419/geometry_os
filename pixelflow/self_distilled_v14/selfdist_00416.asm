; DESCRIPTION: Places a yellow 14x77 box at position (334, 42).
; PLAN: r0=334(x), r1=42(y), r2=14(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 42
LDI r2, 14
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
