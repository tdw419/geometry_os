; DESCRIPTION: Places a white 45x71 box at position (130, 89).
; PLAN: r0=130(x), r1=89(y), r2=45(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 89
LDI r2, 45
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
