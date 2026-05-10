; DESCRIPTION: Places a orange 120x12 box at position (36, 95).
; PLAN: r0=36(x), r1=95(y), r2=120(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 95
LDI r2, 120
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
