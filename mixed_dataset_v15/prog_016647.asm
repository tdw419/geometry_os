; DESCRIPTION: Places a purple 51x68 rectangle at position (410, 44).
; PLAN: r0=410(x), r1=44(y), r2=51(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 44
LDI r2, 51
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
