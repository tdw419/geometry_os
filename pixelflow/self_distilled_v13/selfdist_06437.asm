; DESCRIPTION: Places a white 95x10 box at position (60, 83).
; PLAN: r0=60(x), r1=83(y), r2=95(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 83
LDI r2, 95
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
