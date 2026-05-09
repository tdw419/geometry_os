; DESCRIPTION: Places a yellow 94x48 rectangle at position (169, 62).
; PLAN: r0=169(x), r1=62(y), r2=94(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 62
LDI r2, 94
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
