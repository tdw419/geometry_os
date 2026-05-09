; DESCRIPTION: Places a yellow 112x90 rectangle at position (36, 153).
; PLAN: r0=36(x), r1=153(y), r2=112(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 153
LDI r2, 112
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
