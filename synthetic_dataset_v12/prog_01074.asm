; DESCRIPTION: Renders a white box of size 61x37 starting at (106, 213).
; PLAN: r0=106(x), r1=213(y), r2=61(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 213
LDI r2, 61
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
