; DESCRIPTION: Renders a white box of size 51x48 starting at (145, 187).
; PLAN: r0=145(x), r1=187(y), r2=51(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 187
LDI r2, 51
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
