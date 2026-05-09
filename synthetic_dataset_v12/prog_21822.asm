; DESCRIPTION: Renders a yellow box of size 17x56 starting at (175, 146).
; PLAN: r0=175(x), r1=146(y), r2=17(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 146
LDI r2, 17
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
