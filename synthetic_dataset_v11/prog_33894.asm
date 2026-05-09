; DESCRIPTION: Renders a green box of size 42x77 starting at (175, 1).
; PLAN: r0=175(x), r1=1(y), r2=42(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 1
LDI r2, 42
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
