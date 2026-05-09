; DESCRIPTION: Renders a green box of size 89x60 starting at (79, 27).
; PLAN: r0=79(x), r1=27(y), r2=89(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 27
LDI r2, 89
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
