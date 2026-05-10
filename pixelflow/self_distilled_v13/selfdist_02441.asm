; DESCRIPTION: Places a red 11x97 box at position (262, 150).
; PLAN: r0=262(x), r1=150(y), r2=11(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 150
LDI r2, 11
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
