; DESCRIPTION: Renders a cyan box of size 99x86 starting at (130, 155).
; PLAN: r0=130(x), r1=155(y), r2=99(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 155
LDI r2, 99
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
