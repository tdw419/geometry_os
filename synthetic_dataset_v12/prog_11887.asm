; DESCRIPTION: Places a yellow 79x72 rectangle at position (375, 107).
; PLAN: r0=375(x), r1=107(y), r2=79(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 107
LDI r2, 79
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
