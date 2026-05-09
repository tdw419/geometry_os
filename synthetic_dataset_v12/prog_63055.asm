; DESCRIPTION: Places a black 50x112 rectangle at position (75, 37).
; PLAN: r0=75(x), r1=37(y), r2=50(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 37
LDI r2, 50
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
