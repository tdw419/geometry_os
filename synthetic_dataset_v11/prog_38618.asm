; DESCRIPTION: Renders a white box of size 45x79 starting at (198, 37).
; PLAN: r0=198(x), r1=37(y), r2=45(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 37
LDI r2, 45
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
