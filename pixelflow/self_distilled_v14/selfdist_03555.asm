; DESCRIPTION: Places a white 51x54 box at position (346, 176).
; PLAN: r0=346(x), r1=176(y), r2=51(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 176
LDI r2, 51
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
