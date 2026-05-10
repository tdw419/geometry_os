; DESCRIPTION: Places a red 24x52 box at position (70, 83).
; PLAN: r0=70(x), r1=83(y), r2=24(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 83
LDI r2, 24
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
