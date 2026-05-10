; DESCRIPTION: Places a yellow 92x99 rectangle at position (220, 127).
; PLAN: r0=220(x), r1=127(y), r2=92(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 127
LDI r2, 92
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
