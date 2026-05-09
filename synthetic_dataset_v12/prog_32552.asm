; DESCRIPTION: Places a yellow 59x120 rectangle at position (350, 75).
; PLAN: r0=350(x), r1=75(y), r2=59(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 75
LDI r2, 59
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
