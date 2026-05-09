; DESCRIPTION: Renders a white box of size 106x116 starting at (277, 6).
; PLAN: r0=277(x), r1=6(y), r2=106(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 6
LDI r2, 106
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
