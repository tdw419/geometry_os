; DESCRIPTION: Places a purple 44x33 rectangle at position (106, 210).
; PLAN: r0=106(x), r1=210(y), r2=44(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 210
LDI r2, 44
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
