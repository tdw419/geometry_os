; DESCRIPTION: Places a white 82x82 rectangle at position (169, 20).
; PLAN: r0=169(x), r1=20(y), r2=82(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 20
LDI r2, 82
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
