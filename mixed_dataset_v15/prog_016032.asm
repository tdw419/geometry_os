; DESCRIPTION: Places a green 44x33 box at position (293, 160).
; PLAN: r0=293(x), r1=160(y), r2=44(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 160
LDI r2, 44
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
