; DESCRIPTION: Renders a green box of size 120x79 starting at (217, 35).
; PLAN: r0=217(x), r1=35(y), r2=120(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 35
LDI r2, 120
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
