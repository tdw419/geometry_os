; DESCRIPTION: Renders a cyan box of size 79x44 starting at (106, 130).
; PLAN: r0=106(x), r1=130(y), r2=79(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 130
LDI r2, 79
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
