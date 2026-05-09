; DESCRIPTION: Creates a purple rectangular region at (207, 197) spanning 103 by 51 pixels.
; PLAN: r0=207(x), r1=197(y), r2=103(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 197
LDI r2, 103
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
