; DESCRIPTION: Places a white 109x24 rectangle at position (105, 187).
; PLAN: r0=105(x), r1=187(y), r2=109(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 187
LDI r2, 109
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
