; DESCRIPTION: Renders a green box of size 18x77 starting at (263, 11).
; PLAN: r0=263(x), r1=11(y), r2=18(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 11
LDI r2, 18
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
