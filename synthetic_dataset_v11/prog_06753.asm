; DESCRIPTION: Renders a green box of size 79x47 starting at (26, 195).
; PLAN: r0=26(x), r1=195(y), r2=79(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 195
LDI r2, 79
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
