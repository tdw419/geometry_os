; DESCRIPTION: Places a green 72x58 rectangle at position (182, 59).
; PLAN: r0=182(x), r1=59(y), r2=72(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 59
LDI r2, 72
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
