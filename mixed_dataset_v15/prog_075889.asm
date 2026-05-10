; DESCRIPTION: Places a black 60x116 rectangle at position (75, 117).
; PLAN: r0=75(x), r1=117(y), r2=60(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 117
LDI r2, 60
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
