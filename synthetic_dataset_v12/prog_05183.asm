; DESCRIPTION: Renders a purple box of size 16x77 starting at (281, 72).
; PLAN: r0=281(x), r1=72(y), r2=16(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 72
LDI r2, 16
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
