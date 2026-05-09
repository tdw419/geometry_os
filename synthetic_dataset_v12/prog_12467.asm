; DESCRIPTION: Places a black 36x107 rectangle at position (400, 44).
; PLAN: r0=400(x), r1=44(y), r2=36(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 44
LDI r2, 36
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
