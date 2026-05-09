; DESCRIPTION: Places a green 44x90 rectangle at position (250, 38).
; PLAN: r0=250(x), r1=38(y), r2=44(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 38
LDI r2, 44
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
