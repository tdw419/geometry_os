; DESCRIPTION: Places a green 10x52 rectangle at position (267, 102).
; PLAN: r0=267(x), r1=102(y), r2=10(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 102
LDI r2, 10
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
