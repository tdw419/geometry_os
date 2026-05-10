; DESCRIPTION: Places a green 63x116 rectangle at position (193, 92).
; PLAN: r0=193(x), r1=92(y), r2=63(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 92
LDI r2, 63
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
