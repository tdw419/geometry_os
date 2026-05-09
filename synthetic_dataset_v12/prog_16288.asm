; DESCRIPTION: Places a white 99x71 rectangle at position (132, 112).
; PLAN: r0=132(x), r1=112(y), r2=99(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 112
LDI r2, 99
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
