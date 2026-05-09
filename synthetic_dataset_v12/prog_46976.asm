; DESCRIPTION: Renders a green box of size 102x24 starting at (268, 202).
; PLAN: r0=268(x), r1=202(y), r2=102(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 202
LDI r2, 102
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
