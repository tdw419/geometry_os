; DESCRIPTION: Composite: . Then Renders a yellow box of size 81x87 starting at (123, 155). Then Places a magenta dot at position (38, 243).
; PLAN: r0=123(x), r1=155(y), r2=81(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=38(x), r1=243(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 81x87 starting at (123, 155).
; PLAN: r0=123(x), r1=155(y), r2=81(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 155
LDI r2, 81
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (38, 243).
; PLAN: r0=38(x), r1=243(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 243
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
