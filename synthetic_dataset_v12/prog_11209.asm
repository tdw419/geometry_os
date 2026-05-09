; DESCRIPTION: Places a red 27x112 rectangle at position (145, 26).
; PLAN: r0=145(x), r1=26(y), r2=27(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 26
LDI r2, 27
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
