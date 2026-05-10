; DESCRIPTION: Places a white 10x50 box at position (112, 75).
; PLAN: r0=112(x), r1=75(y), r2=10(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 75
LDI r2, 10
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
