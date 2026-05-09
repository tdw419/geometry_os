; DESCRIPTION: Places a white 37x91 rectangle at position (169, 136).
; PLAN: r0=169(x), r1=136(y), r2=37(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 136
LDI r2, 37
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
