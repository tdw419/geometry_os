; DESCRIPTION: Renders a yellow box of size 72x74 starting at (387, 39).
; PLAN: r0=387(x), r1=39(y), r2=72(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 39
LDI r2, 72
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
