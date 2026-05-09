; DESCRIPTION: Places a black 117x85 rectangle at position (146, 117).
; PLAN: r0=146(x), r1=117(y), r2=117(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 117
LDI r2, 117
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
