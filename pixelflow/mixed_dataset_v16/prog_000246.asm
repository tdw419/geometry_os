; DESCRIPTION: Renders a green box of size 103x97 starting at (80, 37).
; PLAN: r0=80(x), r1=37(y), r2=103(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 37
LDI r2, 103
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
