; DESCRIPTION: Places a white 88x112 rectangle at position (80, 132).
; PLAN: r0=80(x), r1=132(y), r2=88(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 132
LDI r2, 88
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
