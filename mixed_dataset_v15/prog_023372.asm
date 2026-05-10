; DESCRIPTION: Places a yellow 94x59 rectangle at position (215, 132).
; PLAN: r0=215(x), r1=132(y), r2=94(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 132
LDI r2, 94
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
