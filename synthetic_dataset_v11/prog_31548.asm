; DESCRIPTION: Renders a white box of size 56x27 starting at (115, 46).
; PLAN: r0=115(x), r1=46(y), r2=56(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 46
LDI r2, 56
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
