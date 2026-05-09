; DESCRIPTION: Renders a cyan box of size 101x68 starting at (242, 123).
; PLAN: r0=242(x), r1=123(y), r2=101(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 123
LDI r2, 101
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
