; DESCRIPTION: Renders a yellow box of size 111x27 starting at (387, 185).
; PLAN: r0=387(x), r1=185(y), r2=111(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 185
LDI r2, 111
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
