; DESCRIPTION: Places a green 94x44 box at position (305, 112).
; PLAN: r0=305(x), r1=112(y), r2=94(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 112
LDI r2, 94
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
