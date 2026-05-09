; DESCRIPTION: Places a white 112x29 rectangle at position (187, 160).
; PLAN: r0=187(x), r1=160(y), r2=112(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 160
LDI r2, 112
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
