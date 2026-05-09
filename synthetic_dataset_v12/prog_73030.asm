; DESCRIPTION: Places a red 57x77 rectangle at position (140, 6).
; PLAN: r0=140(x), r1=6(y), r2=57(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 6
LDI r2, 57
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
