; DESCRIPTION: Places a red 79x60 rectangle at position (350, 107).
; PLAN: r0=350(x), r1=107(y), r2=79(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 107
LDI r2, 79
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
