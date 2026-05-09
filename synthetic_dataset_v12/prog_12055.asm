; DESCRIPTION: Places a white 112x112 rectangle at position (130, 126).
; PLAN: r0=130(x), r1=126(y), r2=112(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 126
LDI r2, 112
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
