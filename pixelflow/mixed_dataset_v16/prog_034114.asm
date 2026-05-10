; DESCRIPTION: Renders a green box of size 27x98 starting at (243, 49).
; PLAN: r0=243(x), r1=49(y), r2=27(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 49
LDI r2, 27
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
