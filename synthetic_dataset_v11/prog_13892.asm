; DESCRIPTION: Renders a cyan box of size 71x23 starting at (70, 65).
; PLAN: r0=70(x), r1=65(y), r2=71(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 65
LDI r2, 71
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
