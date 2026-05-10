; DESCRIPTION: Places a red 79x96 rectangle at position (400, 108).
; PLAN: r0=400(x), r1=108(y), r2=79(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 108
LDI r2, 79
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
