; DESCRIPTION: Places a blue 107x100 rectangle at position (260, 45).
; PLAN: r0=260(x), r1=45(y), r2=107(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 45
LDI r2, 107
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
