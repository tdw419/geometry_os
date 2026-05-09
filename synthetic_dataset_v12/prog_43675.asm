; DESCRIPTION: Places a blue 111x71 rectangle at position (79, 37).
; PLAN: r0=79(x), r1=37(y), r2=111(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 37
LDI r2, 111
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
