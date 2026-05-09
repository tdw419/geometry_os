; DESCRIPTION: Renders a yellow box of size 93x44 starting at (127, 146).
; PLAN: r0=127(x), r1=146(y), r2=93(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 146
LDI r2, 93
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
