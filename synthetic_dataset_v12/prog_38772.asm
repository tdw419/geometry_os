; DESCRIPTION: Places a yellow 72x40 rectangle at position (384, 51).
; PLAN: r0=384(x), r1=51(y), r2=72(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 51
LDI r2, 72
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
