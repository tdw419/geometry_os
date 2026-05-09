; DESCRIPTION: Renders a white box of size 97x27 starting at (77, 152).
; PLAN: r0=77(x), r1=152(y), r2=97(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 152
LDI r2, 97
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
