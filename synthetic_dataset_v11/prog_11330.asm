; DESCRIPTION: Renders a yellow box of size 63x54 starting at (109, 146).
; PLAN: r0=109(x), r1=146(y), r2=63(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 146
LDI r2, 63
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
