; DESCRIPTION: Places a blue circle of radius 27 at center (179, 146).
; PLAN: r0=179(x), r1=146(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 146
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
