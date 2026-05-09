; DESCRIPTION: Places a white 90x80 rectangle at position (147, 107).
; PLAN: r0=147(x), r1=107(y), r2=90(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 107
LDI r2, 90
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
