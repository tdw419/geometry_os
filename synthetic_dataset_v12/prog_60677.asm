; DESCRIPTION: Renders a white box of size 13x25 starting at (249, 207).
; PLAN: r0=249(x), r1=207(y), r2=13(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 207
LDI r2, 13
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
