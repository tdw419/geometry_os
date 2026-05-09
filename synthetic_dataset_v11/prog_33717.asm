; DESCRIPTION: Renders a white box of size 13x98 starting at (70, 21).
; PLAN: r0=70(x), r1=21(y), r2=13(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 21
LDI r2, 13
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
