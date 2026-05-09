; DESCRIPTION: Renders a cyan box of size 36x10 starting at (65, 142).
; PLAN: r0=65(x), r1=142(y), r2=36(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 142
LDI r2, 36
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
