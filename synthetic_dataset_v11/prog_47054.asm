; DESCRIPTION: Renders a green box of size 54x12 starting at (79, 7).
; PLAN: r0=79(x), r1=7(y), r2=54(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 7
LDI r2, 54
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
