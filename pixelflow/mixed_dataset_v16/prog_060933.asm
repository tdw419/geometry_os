; DESCRIPTION: Renders a cyan box of size 16x37 starting at (226, 129).
; PLAN: r0=226(x), r1=129(y), r2=16(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 129
LDI r2, 16
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
