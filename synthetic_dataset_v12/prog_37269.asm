; DESCRIPTION: Renders a green box of size 72x56 starting at (281, 110).
; PLAN: r0=281(x), r1=110(y), r2=72(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 110
LDI r2, 72
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
