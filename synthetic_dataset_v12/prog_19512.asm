; DESCRIPTION: Places a white 19x47 rectangle at position (260, 188).
; PLAN: r0=260(x), r1=188(y), r2=19(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 188
LDI r2, 19
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
