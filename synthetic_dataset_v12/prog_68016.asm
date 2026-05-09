; DESCRIPTION: Places a yellow 32x111 rectangle at position (243, 123).
; PLAN: r0=243(x), r1=123(y), r2=32(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 123
LDI r2, 32
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
