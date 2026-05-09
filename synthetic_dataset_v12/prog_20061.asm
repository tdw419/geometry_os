; DESCRIPTION: Renders a white box of size 107x106 starting at (243, 143).
; PLAN: r0=243(x), r1=143(y), r2=107(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 143
LDI r2, 107
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
