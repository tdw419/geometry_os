; DESCRIPTION: Places a red 106x52 rectangle at position (47, 159).
; PLAN: r0=47(x), r1=159(y), r2=106(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 159
LDI r2, 106
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
