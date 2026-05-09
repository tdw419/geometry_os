; DESCRIPTION: Places a red 48x101 rectangle at position (464, 144).
; PLAN: r0=464(x), r1=144(y), r2=48(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 144
LDI r2, 48
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
