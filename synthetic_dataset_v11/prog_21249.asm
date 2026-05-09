; DESCRIPTION: Renders a yellow box of size 115x27 starting at (49, 146).
; PLAN: r0=49(x), r1=146(y), r2=115(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 146
LDI r2, 115
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
