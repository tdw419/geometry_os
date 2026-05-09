; DESCRIPTION: Places a white 51x85 rectangle at position (198, 86).
; PLAN: r0=198(x), r1=86(y), r2=51(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 86
LDI r2, 51
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
