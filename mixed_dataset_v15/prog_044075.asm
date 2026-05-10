; DESCRIPTION: Places a white 109x60 box at position (260, 184).
; PLAN: r0=260(x), r1=184(y), r2=109(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 184
LDI r2, 109
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
