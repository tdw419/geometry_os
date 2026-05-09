; DESCRIPTION: Renders a cyan box of size 54x29 starting at (217, 205).
; PLAN: r0=217(x), r1=205(y), r2=54(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 205
LDI r2, 54
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
