; DESCRIPTION: Places a white 95x54 box at position (292, 87).
; PLAN: r0=292(x), r1=87(y), r2=95(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 87
LDI r2, 95
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
