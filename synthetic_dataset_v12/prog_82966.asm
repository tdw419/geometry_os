; DESCRIPTION: Places a yellow 103x92 rectangle at position (215, 59).
; PLAN: r0=215(x), r1=59(y), r2=103(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 59
LDI r2, 103
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
