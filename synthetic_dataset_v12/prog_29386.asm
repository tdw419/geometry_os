; DESCRIPTION: Renders a black box of size 54x28 starting at (242, 200).
; PLAN: r0=242(x), r1=200(y), r2=54(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 200
LDI r2, 54
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
