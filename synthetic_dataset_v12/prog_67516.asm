; DESCRIPTION: Renders a yellow box of size 59x93 starting at (392, 43).
; PLAN: r0=392(x), r1=43(y), r2=59(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 43
LDI r2, 59
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
