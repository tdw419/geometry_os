; DESCRIPTION: Places a yellow 48x72 rectangle at position (304, 133).
; PLAN: r0=304(x), r1=133(y), r2=48(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 133
LDI r2, 48
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
