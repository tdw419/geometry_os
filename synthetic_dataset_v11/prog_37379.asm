; DESCRIPTION: Places a green 79x30 rectangle at position (36, 141).
; PLAN: r0=36(x), r1=141(y), r2=79(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 141
LDI r2, 79
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
