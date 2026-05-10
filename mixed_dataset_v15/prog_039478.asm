; DESCRIPTION: Places a white 27x79 rectangle at position (185, 69).
; PLAN: r0=185(x), r1=69(y), r2=27(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 69
LDI r2, 27
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
