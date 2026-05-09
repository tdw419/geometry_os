; DESCRIPTION: Places a purple 15x44 rectangle at position (487, 160).
; PLAN: r0=487(x), r1=160(y), r2=15(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 160
LDI r2, 15
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
