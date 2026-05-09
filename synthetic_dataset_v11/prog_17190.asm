; DESCRIPTION: Places a white 86x79 rectangle at position (142, 146).
; PLAN: r0=142(x), r1=146(y), r2=86(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 146
LDI r2, 86
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
