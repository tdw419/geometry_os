; DESCRIPTION: Places a white 107x47 rectangle at position (250, 87).
; PLAN: r0=250(x), r1=87(y), r2=107(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 87
LDI r2, 107
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
