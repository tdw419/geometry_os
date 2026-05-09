; DESCRIPTION: Renders a cyan box of size 22x112 starting at (167, 129).
; PLAN: r0=167(x), r1=129(y), r2=22(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 129
LDI r2, 22
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
