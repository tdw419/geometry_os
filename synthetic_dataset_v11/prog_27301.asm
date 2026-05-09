; DESCRIPTION: Places a yellow 33x59 rectangle at position (215, 87).
; PLAN: r0=215(x), r1=87(y), r2=33(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 87
LDI r2, 33
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
