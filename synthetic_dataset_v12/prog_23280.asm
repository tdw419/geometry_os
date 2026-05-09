; DESCRIPTION: Places a yellow 72x38 rectangle at position (181, 196).
; PLAN: r0=181(x), r1=196(y), r2=72(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 196
LDI r2, 72
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
