; DESCRIPTION: Renders a green box of size 77x87 starting at (180, 87).
; PLAN: r0=180(x), r1=87(y), r2=77(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 87
LDI r2, 77
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
