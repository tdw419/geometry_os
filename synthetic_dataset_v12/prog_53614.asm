; DESCRIPTION: Renders a cyan box of size 88x80 starting at (37, 107).
; PLAN: r0=37(x), r1=107(y), r2=88(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 107
LDI r2, 88
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
