; DESCRIPTION: Places a white 29x40 rectangle at position (46, 51).
; PLAN: r0=46(x), r1=51(y), r2=29(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 51
LDI r2, 29
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
