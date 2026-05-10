; DESCRIPTION: Renders a green box of size 56x57 starting at (177, 68).
; PLAN: r0=177(x), r1=68(y), r2=56(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 68
LDI r2, 56
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
