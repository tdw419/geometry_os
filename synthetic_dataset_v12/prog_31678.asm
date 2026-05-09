; DESCRIPTION: Places a green 36x54 rectangle at position (96, 44).
; PLAN: r0=96(x), r1=44(y), r2=36(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 44
LDI r2, 36
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
