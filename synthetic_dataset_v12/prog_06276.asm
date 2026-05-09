; DESCRIPTION: Places a blue 48x59 rectangle at position (221, 6).
; PLAN: r0=221(x), r1=6(y), r2=48(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 6
LDI r2, 48
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
